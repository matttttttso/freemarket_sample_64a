class RenameFamilyNameKanjiColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :family_name_kanji, :family_name
    rename_column :addresses, :first_name_kanji, :first_name
    rename_column :addresses, :family_name_kana, :family_name_katakana
    rename_column :addresses, :first_name_kana, :first_name_katakana
    rename_column :addresses, :phone_number, :telephone_number
  end
end
