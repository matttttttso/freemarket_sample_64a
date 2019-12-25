crumb :root do
  link "フリーマーケット", root_path
end

crumb :mypage do
  link "マイページ", mypage_users_path
  parent :root
end

crumb :profile do
  link "プロフィール", profile_users_path
  parent :mypage
end

crumb :identity do
  link "本人情報", identity_users_path
  parent :mypage
end

crumb :card_index do
  link "支払い方法", confirmation_card_index_path
  parent :mypage
end

crumb :new_card do
  link "クレジットカード情報入力", new_card_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end
