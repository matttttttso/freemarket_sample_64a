class SignupController < ApplicationController

  def step1
    @user = User.new
  end

  def step2
    # step1で入力されたデータをsessionに保存する
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
    @user = User.new
  end

  def step3
    # step2で入力されたデータをsessionに保存する
    session[:user_phone_number] = user_params[:phone_number]
    @user = User.new
    @user.build_address
  end

  # ここでcreateアクションが動く
  def create
    # step3で入力されたデータをsessionに保存する
    session[:address_attributes] = user_params[:address_attributes]
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
    @user.build_address(session[:address_attributes])
  end

  # 上記で保存されたUserのidとPayjpでクレジットカードを紐付ける
  def step4
  end

  def done
  end

  private

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
        :family_name_kanji,
        :first_name_kanji,
        :family_name_kana,
        :first_name_kana,
        :zip_code,
        :prefecture_id,
        :city,
        :block,
        :building,
        :phone_number
      ]
    )
  end
end
