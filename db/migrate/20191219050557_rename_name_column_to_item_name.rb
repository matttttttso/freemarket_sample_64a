class RenameNameColumnToItemName < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :name, :item_name
  end
end
