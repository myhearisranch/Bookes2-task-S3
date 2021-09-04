class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :body

      t.integer :user_id
      t.string :image_id


      t.timestamps

    validates :title, presence: true
    validates :body, presence: true
    end
  end
end
