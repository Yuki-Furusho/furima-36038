require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname, email, password, password_confirmation, first_nama, last_name, first_name_kana, last_name_kana, birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'メールアドレスに@を含まない場合登録できない' do
        @user.email = Faker::Lorem.characters
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが数字のみの場合登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordが英字のみの場合登録できない' do
        @user.password = 'qwerty'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordが全角文字を含む場合登録できない' do
        @user.password = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = Faker::Lorem.characters(number:5, min_alpha:1, min_numeric: 1)
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = Faker::Lorem.characters(number:6, min_alpha:1, min_numeric: 1)
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）以外の場合登録できない' do
        @user.first_name = Faker::Name.first_name
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）以外の場合登録できない' do
        @user.last_name = Faker::Name.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'first_name_kanaがカタカナ以外の場合登録できない' do
        @user.first_name_kana = Gimei.name.first.kanji
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'last_name_kanaがカタカナ以外の場合登録できない' do
        @user.last_name_kana = Gimei.name.last.kanji
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end
      it 'birthが空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth can't be blank"
      end
    end
  end
end
