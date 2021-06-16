class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings, id: :uuid do |t|
      t.string :ratings
      t.belongs_to :user, null: false, foreign_key: true, type: :uuid
      t.belongs_to :book, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
