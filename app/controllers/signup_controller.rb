class SignupController < ApplicationController
  require "payjp"
  before_action :step1_valid, only: :step2
  before_action :step2_valid, only: :step3

  def step1
    @user = User.new
  end

  def step2
    @user = User.new
  end

  def step3
    @user = User.new
    @user.build_address
  end

  # ここでcreateアクションが動く
  def create
    # sessionに保存されたデータを用いてUserを作成
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      family_name_kanji: session[:family_name_kanji],
      first_name_kanji: session[:first_name_kanji],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birthdate_year: session[:birthdate_year],
      birthdate_month: session[:birthdate_month],
      birthdate_day: session[:birthdate_day],
      phone_number: session[:user_phone_number]
    )
    @user.build_address(user_params[:address_attributes])

    if @user.save
      session[:id] = @user.id
      redirect_to step4_signup_index_path
    else
      render :step3
    end
  end

  def step4
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.create(
      card: params['payjp-token']
    )
    @card = Card.new(user_id: session[:id], customer_id: customer.id, card_id: customer.default_card)
    if @card.save
      redirect_to done_signup_index_path
    else
      redirect_to action: :pay
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private

  def step1_valid
    # step1で入力された項目をsessionに一次保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:family_name_kanji] = user_params[:family_name_kanji]
    session[:first_name_kanji] = user_params[:first_name_kanji]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthdate_year] = user_params[:birthdate_year]
    session[:birthdate_month] = user_params[:birthdate_month]
    session[:birthdate_day] = user_params[:birthdate_day]
    # 仮のインスタンスを作成しバリデーションの確認
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      family_name_kanji: session[:family_name_kanji],
      first_name_kanji: session[:first_name_kanji],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birthdate_year: session[:birthdate_year],
      birthdate_month: session[:birthdate_month],
      birthdate_day: session[:birthdate_day],
      # 未入力項目にはバリデーションに通る値を入れる
      phone_number: "00000000000"
    )
    render :step1 unless @user.valid?
  end

  def step2_valid
    # step2で入力された項目をsessionに一次保存
    session[:user_phone_number] = user_params[:phone_number]
    # 仮のインスタンスを作成しバリデーションの確認
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      family_name_kanji: session[:family_name_kanji],
      first_name_kanji: session[:first_name_kanji],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birthdate_year: session[:birthdate_year],
      birthdate_month: session[:birthdate_month],
      birthdate_day: session[:birthdate_day],
      phone_number: session[:user_phone_number]
    )
    render :step2 unless @user.valid?
  end

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :family_name_kanji,
      :first_name_kanji,
      :family_name_kana,
      :first_name_kana,
      :birthdate_year,
      :birthdate_month,
      :birthdate_day,
      :phone_number,
      address_attributes: [
        :id,
        :family_name,
        :first_name,
        :family_name_katakana,
        :first_name_katakana,
        :zip_code,
        :prefecture_id,
        :city,
        :block,
        :building,
        :telephone_number
      ]
    )
  end
end
