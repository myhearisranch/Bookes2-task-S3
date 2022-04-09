class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  #都道府県コードから都道府県名に自動で変換する。
  include JpPrefecture
  jp_prefecture :prefecture_code
  
  #~.prefecture_nameで都道府県名を参照出来る様にする。
  #例) @user.prefecture_nameで該当ユーザーの住所(都道府県)を表示出来る。

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
  
  def address
    address_city+address_street+address_building
  end
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  attachment :profile_image

  validates :name, length: {maximum: 20}
  validates :name, length: {minimum: 2}
  validates :name, uniqueness: true
  validates :introduction, length: {maximum: 50}
  validates :name, presence: true

end
