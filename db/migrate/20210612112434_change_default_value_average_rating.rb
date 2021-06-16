class ChangeDefaultValueAverageRating < ActiveRecord::Migration[6.1]
  def change
    change_column_default :books, :average_rating, 0
  end
end
