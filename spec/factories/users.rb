FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"0000000a"}
    family_name_kanji     {"佐藤"}
    first_name_kanji      {"健"}
    family_name_kana      {"サトウ"}
    first_name_kana       {"タケル"}
    birthdate_year        {"1990"}
    birthdate_month       {"12"}
    birthdate_day         {"31"}
    phone_number          {"09088888888"}
  end

end