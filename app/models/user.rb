class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  has_one :address
  has_one :card
  accepts_nested_attributes_for :address


  def self.find_for_oauth(auth)
    @user = User.where(uid: auth.uid, provider: auth.provider).first_or_create

    # @user = auth || User.where(email: auth.info.email).first_or_initialize(
    #   nickname: auth.info.name,
    #     email: auth.info.email
    # )
    # if @user.persisted?
    #   auth.user = user
    #   user.save
    # end
    # @user
    #これで動いたら下不要

    unless @user
      @user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        nickname: auth.info.name,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end
    @user
  end

  private

    def self.dummy_email(auth)
      "#{auth.uid}-#{auth.provider}@gmail.com"
    end

  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PHONE_REGEX = /\A\d{10,11}\z/

  # step1バリデーション
  validates :nickname,          presence: true, length: { maximum: 20 }
  validates :email,             presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,          presence: true, length: { minimum: 7, maximum: 128 }, format: { with: VALID_PASSWORD_REGEX }
  validates :family_name_kanji, presence: true
  validates :first_name_kanji,  presence: true
  validates :family_name_kana,  presence: true, format: { with: VALID_KATAKANA_REGEX }
  validates :first_name_kana,   presence: true, format: { with: VALID_KATAKANA_REGEX }
  validates :birthdate_year,    presence: true
  validates :birthdate_month,   presence: true
  validates :birthdate_day,     presence: true

  # step2バリデーション
  validates :phone_number,      presence: true, uniqueness: true, format: { with: VALID_PHONE_REGEX }

end
