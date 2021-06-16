class ChangeRatingsToBeIntegerInRatings < ActiveRecord::Migration[6.1]
  def change
    remove_column :ratings, :ratings
  end
end
