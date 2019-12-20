class ChangeDatatypePrefectureIdOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :prefecture_id, :integer, null: false
  end
end
