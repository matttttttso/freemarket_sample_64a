require 'rails_helper'
describe User do
  describe '#create' do

    # 入力がなければエラーを返すテスト
    it "ニックネームの入力がなければ登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailの入力がなければ登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "パスワードの入力がなければ登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "姓(漢字)の入力がなければ登録できない" do
      user = build(:user, family_name_kanji: "")
      user.valid?
      expect(user.errors[:family_name_kanji]).to include("を入力してください")
    end

    it "名(漢字)の入力がなければ登録できない" do
      user = build(:user, first_name_kanji: "")
      user.valid?
      expect(user.errors[:first_name_kanji]).to include("を入力してください")
    end

    it "姓(カナ)の入力がなければ登録できない" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "名(カナ)の入力がなければ登録できない" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "誕生日(年)の入力がなければ登録できない" do
      user = build(:user, birthdate_year: "")
      user.valid?
      expect(user.errors[:birthdate_year]).to include("を入力してください")
    end

    it "誕生日(月)の入力がなければ登録できない" do
      user = build(:user, birthdate_month: "")
      user.valid?
      expect(user.errors[:birthdate_month]).to include("を入力してください")
    end

    it "誕生日(日)の入力がなければ登録できない" do
      user = build(:user, birthdate_day: "")
      user.valid?
      expect(user.errors[:birthdate_day]).to include("を入力してください")
    end

    it "電話番号の入力がなければ登録できない" do
      user = build(:user, phone_number: "")
      user.valid?
      expect(user.errors[:phone_number]).to include("を入力してください")
    end

    # 20文字以上のニックネームを登録しない
    it "ニックネームが20文字以下なら登録できる" do
      user = build(:user, nickname: "aaaaabbbbbcccccddddd")
      user.valid?
      expect(user).to be_valid
    end

    it "ニックネームが20文字以上なので登録できない" do
      user = build(:user, nickname: "aaaaabbbbbcccccddddde")
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end

    # emailのフォーマットのテスト
    it "emailのフォーマットが正しければ登録できる" do
      user = build(:user, email: "aaa@aaa.com")
      user.valid?
      expect(user).to be_valid
    end

    it "emailのフォーマットが間違っていれば登録できない" do
      user = build(:user, email: "aaa.aaa.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    # パスワードのフォーマットは適切か
    it "パスワードに記号を含めても登録できる" do
      user = build(:user, password: "a123456!@#$%^&*)(=_-")
      user.valid?
      expect(user).to be_valid
    end

    it "パスワードに英字と数字の双方が含まれているので登録できる" do
      user = build(:user, password: "aaaaa12")
      user.valid?
      expect(user).to be_valid
    end

    it "パスワードに英字のみなので登録できない" do
      user = build(:user, password: "aaaaabb")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end

    it "パスワードに数字のみなので登録できない" do
      user = build(:user, password: "1234567")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end

    # パスワードの字数が7〜128かどうか
    it "パスワードが7文字なので登録できる" do
      user = build(:user, password: "aaaaa12")
      user.valid?
      expect(user).to be_valid
    end

    it "パスワードが128文字なので登録できる" do
      user = build(:user, password: "aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa123")
      user.valid?
      expect(user).to be_valid
    end
    
    it "パスワードが6文字なので登録できない" do
      user = build(:user, password: "aaaaa1")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end

    it "パスワードが129文字なので登録できない" do
      user = build(:user, password: "aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa12345aaaaa1234")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end

    # 姓名フリガナがカタカナかどうか
    it "姓のフリガナがカタカナなので登録できる" do
      user = build(:user, family_name_kana: "アベ")
      user.valid?
      expect(user).to be_valid
    end

    it "名のフリガナがカタカナなので登録できる" do
      user = build(:user, first_name_kana: "タロウ")
      user.valid?
      expect(user).to be_valid
    end

    it "姓のフリガナがカタカナではないので登録できない" do
      user = build(:user, family_name_kana: "あべ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end

    it "名のフリガナがカタカナではないので登録できない" do
      user = build(:user, first_name_kana: "たろう")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    # 電話番号のフォーマットのテスト
    it "電話番号のフォーマットが適切なので登録できる" do
      user = build(:user, phone_number: "09012345678")
      user.valid?
      expect(user).to be_valid
    end

    it "電話番号のフォーマットが不正なので登録できない" do
      user = build(:user, phone_number: "a9012345678")
      user.valid?
      expect(user.errors[:phone_number][0]).to include("は不正な値です")
    end
    
  end
end