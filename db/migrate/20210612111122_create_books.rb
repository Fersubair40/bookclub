class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books, id: :uuid do |t|
      t.string :title
      t.string :author
      t.string :book_image
      t.string :book_link
      t.string :description
      t.integer :average_rating
      t.string :primary_isbn10
      t.string :primary_isbn13

      t.timestamps
    end
  end
end
