class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  before_save { self.zip_code = zip_code.gsub(/-/,'') }
  before_save { self.phone_number = phone_number.gsub(/-/,'') }

  VALID_ZIP_REGEX = /\A\d{8}\z/i
  VALID_KATAKANA_REGEX = /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/

  # step3バリデーション
  validates :family_name_kanji, presence: true
  validates :first_name_kanji,  presence: true
  validates :family_name_kana,  presence: true, format: { with: VALID_KATAKANA_REGEX, allow_blank: true }
  validates :first_name_kana,   presence: true, format: { with: VALID_KATAKANA_REGEX, allow_blank: true }
  validates :zip_code,          presence: true, format: { with: VALID_ZIP_REGEX, allow_blank: true }
  validates :prefecture_id,     presence: true
  validates :city,              presence: true
  validates :block,             presence: true
  validates :building
  validates :phone_number,      format: { with: VALID_PHONE_REGEX, allow_blank: true }
end
