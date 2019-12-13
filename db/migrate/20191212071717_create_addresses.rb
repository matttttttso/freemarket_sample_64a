class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :family_name_kanji, null: false
      t.string :first_name_kanji,  null: false
      t.string :family_name_kana,  null: false
      t.string :first_name_kana,   null:false
      t.integer :zip_code,         null: false
      t.integer :prefecture,       null: false
      t.string :city,              null: false
      t.string :block,             null: false
      t.string :building,          null: false
      t.integer :phone_number
      t.references :user,          foreign_key: true

      t.timestamps
    end
  end
end
