class Book < ApplicationRecord

  belongs_to :user
  has_many :book_comments, dependent: :destroy


  validates :title, presence: true
  validates :body, presence: true
  validates :title, length: {maximum: 200}
  validates :body, length: {maximum: 200}

end
