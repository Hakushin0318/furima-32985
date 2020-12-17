require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nameとemail、passwordとpassword_confirmation、last_name,first_name,last_name_ruby,first_name_ruby,birthdayが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "123hoge"
      @user.password_confirmation = "123hoge"
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "＠を含んでいないとemailは登録ができないこと" do
      @user.email = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "1hoge"
      @user.password_confirmation = "1hoge"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordが半角数字だけでは登録ができない" do
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが半角アルファベットだけでは登録ができない" do
      @user.password_confirmation = "abcdefg"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが全角アルファベットでは登録ができない" do
      @user.password_confirmation = "123ｋｒｔ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "12hoge"
      @user.password_confirmation = "123hoge"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end

    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "漢字・平仮名・カタカナ以外では登録できないこと" do
      @user.first_name = "ageage"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "漢字・平仮名・カタカナ以外では登録できないこと" do
      @user.last_name = "ageage"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "first_name_rubyが空では登録できないこと" do
      @user.first_name_ruby = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name ruby can't be blank")
    end

    it "全角カタカナ以外では登録できないこと" do
      @user.first_name_ruby = "全角"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name ruby is invalid")
    end

    it "last_name_rubyが空では登録できないこと" do
      @user.last_name_ruby = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name ruby can't be blank")
    end

    it "全角カタカナ以外では登録できないこと" do
      @user.last_name_ruby = "全角"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name ruby is invalid")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
