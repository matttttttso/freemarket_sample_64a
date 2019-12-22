crumb :root do
  link "フリーマーケット", root_path
end

crumb :mypage do
  link "マイページ", mypage_review_users_path
  parent :root
end

crumb :address do
  link "発送元・お届け先住所変更", address_review_users_path
  parent :mypage
end

crumb :identity do
  link "本人情報", identity_review_users_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_review_users_path
  parent :mypage
end


# （分からず仮置き中）
# crumb :category do
#   link “カテゴリから探す“, users_path
#   parent :root #仮おきです
# end
# crumb :brand do
#   link “ブランドから探す“, brand_path
#   parent :root #仮おきです
# end
# （分からず仮置き中）
# crumb : like do
#   link “いいね！一覧“, like_path
#   parent #仮置き
# end

# crumb :basic_info do
#   link “お知らせ“, basic_info_review_users_path
#   parent :mypage
# end

# crumb :new do
#   link “やることリスト“, new_review_users_path
#   parent :mypage
# end



# crumb :creditcard do
#   link “支払い方法“, creditcard_review_users_path
#   parent :mypage
# end

# crumb :password do
#   link “メール/パスワード“, user_password_path
#   parent :mypage
# end



# crumb :phone_num do
#   link “電話番号の確認“, phone_num_review_users_path
#   parent :mypage
# end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).