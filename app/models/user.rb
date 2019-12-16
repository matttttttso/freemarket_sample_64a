class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address
  accepts_nested_attributes_for :address

  before_save { self.email = email.downcase }
  before_save { self.phone_number = phone_number.gsub(/-/,'') }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i
  VALID_KATAKANA_REGEX = /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/

  # step1バリデーション
  validates :nickname,          presence: true, length: { maximum: 20 }
  validates :email,             presence: true, uniqueness: { case_sensitive: false, allow_blank: true }, format: { with: VALID_EMAIL_REGEX, allow_blank: true }
  validates :password,          presence: true, length: { minimum: 7, maximum: 128 }, format: { with: VALID_PASSWORD_REGEX, allow_blank: true }
  validates :family_name_kanji, presence: true
  validates :first_name_kanji,  presence: true
  validates :family_name_kana,  presence: true, format: { with: VALID_KATAKANA_REGEX, allow_blank: true }
  validates :first_name_kana,   presence: true, format: { with: VALID_KATAKANA_REGEX, allow_blank: true }
  validates :birthdate_year,    presence: true
  validates :birthdate_month,   presence: true
  validates :birthdate_day,     presence: true

  # step2バリデーション
  validates :phone_number,      presence: true, format: { with: VALID_PHONE_REGEX, allow_blank: true }
end
