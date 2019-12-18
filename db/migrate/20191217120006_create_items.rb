class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,            null: false
      t.text :explain,           null: false
      t.string :category,        null: false
      t.string :size,            null: false
      t.string :brand,           null: false
      t.string :condition,       null: false
      t.string :postage,         null: false
      t.string :shipping_method, null: false
      t.string :region,          null: false
      t.string :shipping_days,   null: false
      t.integer :price,          null: false
      t.references :user,        foreign_key: true

      t.timestamps
    end
  end
end
