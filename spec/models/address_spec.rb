require 'rails_helper'
describe Address do
  describe '#create' do

    # 入力がなければエラーを返すテスト
    it "姓の入力がなければ登録できない" do
      address = build(:address, family_name: "")
      address.valid?
      expect(address.errors[:family_name]).to include("を入力してください")
    end

    it "名の入力がなければ登録できない" do
      address = build(:address, first_name: "")
      address.valid?
      expect(address.errors[:first_name]).to include("を入力してください")
    end

    it "姓(カナ)の入力がなければ登録できない" do
      address = build(:address, family_name_katakana: "")
      address.valid?
      expect(address.errors[:family_name_katakana]).to include("を入力してください")
    end

    it "名(カナ)の入力がなければ登録できない" do
      address = build(:address, first_name_katakana: "")
      address.valid?
      expect(address.errors[:first_name_katakana]).to include("を入力してください")
    end

    it "郵便番号の入力がなければ登録できない" do
      address = build(:address, zip_code: "")
      address.valid?
      expect(address.errors[:zip_code]).to include("を入力してください")
    end

    it "都道府県の入力がなければ登録できない" do
      address = build(:address, prefecture_id: "")
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください")
    end

    it "市区町村の入力がなければ登録できない" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "番地の入力がなければ登録できない" do
      address = build(:address, block: "")
      address.valid?
      expect(address.errors[:block]).to include("を入力してください")
    end

    # 入力がなくても登録できる
    it "建物名の入力がなくても登録できる" do
      address = build(:address, building: "")
      address.valid?
      expect(address).to be_valid
    end

    it "電話番号の入力がなくても登録できる" do
      address = build(:address, telephone_number: "")
      address.valid?
      expect(address).to be_valid
    end

    # 姓名フリガナがカタカナかどうか
    it "姓のフリガナがカタカナなので登録できる" do
      address = build(:address, family_name_katakana: "アベ")
      address.valid?
      expect(address).to be_valid
    end

    it "名のフリガナがカタカナなので登録できる" do
      address = build(:address, first_name_katakana: "タロウ")
      address.valid?
      expect(address).to be_valid
    end

    it "姓のフリガナがカタカナではないので登録できない" do
      address = build(:address, family_name_katakana: "あべ")
      address.valid?
      expect(address.errors[:family_name_katakana]).to include("は不正な値です")
    end

    it "名のフリガナがカタカナではないので登録できない" do
      address = build(:address, first_name_katakana: "たろう")
      address.valid?
      expect(address.errors[:first_name_katakana]).to include("は不正な値です")
    end

    # 郵便番号のフォーマットが適切か
    it "郵便番号のフォーマットが適切なので登録できる" do
      address = build(:address, zip_code: "123-4567")
      address.valid?
      expect(address).to be_valid
    end

    it "郵便番号のフォーマットが不適切なので登録できない" do
      address = build(:address, zip_code: "a12-2345")
      address.valid?
      expect(address.errors[:zip_code]).to include("は不正な値です")
    end

    # 電話番号のフォーマットが適切か
    it "電話番号のフォーマットが適切なので登録できる" do
      address = build(:address, telephone_number: "09012345678")
      address.valid?
      expect(address).to be_valid
    end

    it "電話番号のフォーマットが不適切なので登録できない" do
      address = build(:address, telephone_number: "a9012345678")
      address.valid?
      expect(address.errors[:telephone_number]).to include("は不正な値です")
    end

  end
end