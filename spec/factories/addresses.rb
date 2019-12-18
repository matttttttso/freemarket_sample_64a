FactoryBot.define do

  factory :address do
    family_name             {"佐藤"}
    first_name              {"健"}
    family_name_katakana    {"サトウ"}
    first_name_katakana     {"タケル"}
    zip_code                {"123-4567"}
    prefecture_id           {"47"}
    city                    {"テスト市"}
    block                   {"テスト町1−1−1"}
    building                {"テストマンション101"}
    telephone_number        {"09012345678"}
  end

end