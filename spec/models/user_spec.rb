require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー認証' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '新規登録ボタンを押す' do
      expect(@user).to be_valid
    end
    it 'ニックネームが必須であること' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは@を含む必要があること' do
      @user.email = '@'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが必須であること' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは6文字以上であること' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      expect(@user).to be_valid
    end
    it 'パスワードは半角英数字混合であること' do
      @user.password = 'a1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは確認用を含めて2回入力すること' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'ユーザー本名が、名字と名前がそれぞれ必須であること' do
      @user.password = nil
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること' do
      @user.firstname = 'a'
      @user.lastname = 'a'
      expect(@user).to be_valid
    end
    it 'ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること' do
      @user.f_furigana = 'a'
      @user.l_furigana = 'a'
      expect(@user).to be_valid
    end
    it 'ユーザー本名のフリガナは全角（カタカナ）で入力させること' do
      @user.f_furigana = 'カタカナ'
      @user.l_furigana = 'カタカナ'
      expect(@user).to be_valid
    end
    it '生年月日が必須であること' do
      @user.birthday = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
