class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  VALID_ZIP_CODE = /\A\d{3}-\d{4}\z/i
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PHONE_REGEX = /\A\d{10,11}\z/

  # step3バリデーション
  validates :family_name,          presence: true
  validates :first_name,           presence: true
  validates :family_name_katakana, presence: true, format: { with: VALID_KATAKANA_REGEX }
  validates :first_name_katakana,  presence: true, format: { with: VALID_KATAKANA_REGEX }
  validates :zip_code,             presence: true, format: { with: VALID_ZIP_CODE }
  validates :prefecture_id,        presence: true
  validates :city,                 presence: true
  validates :block,                presence: true
  validates :telephone_number,     format: { with: VALID_PHONE_REGEX }, allow_blank: true
end
