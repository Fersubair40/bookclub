class AddListNameToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :list_name, :string
  end
end
