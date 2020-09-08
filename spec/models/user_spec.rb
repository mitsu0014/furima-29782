require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての登録要素が存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@が入っていなければ登録できないこと' do
      @user.email = '1111iiaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      first_user = FactoryBot.build(:user, email: @user.email)
      first_user.valid?
      expect(first_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが存在しても半角英数字混合でなければ登録できないこと' do
      @user.password = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'ユーザー本名(名字)が空なら登録できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'ユーザー本名(名前)が空なら登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'ユーザー本名(名字)が存在しても(漢字・ひらがな・カタカナ）でなければ登録できないこと' do
      @user.family_name = 'ABCDEFG'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid. Input full-width characters.')
    end

    it 'ユーザー本名(名前)が存在しても(漢字・ひらがな・カタカナ）でなければ登録できないこと' do
      @user.first_name = 'ABCDEFGH'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
    end

    it 'ユーザーフリガナ(名字)が空なら登録できないこと' do
      @user.kana_family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana family name is invalid. Input full-width katakana characters.')
    end

    it 'ユーザーフリガナ(名前)が空なら登録できないこと' do
      @user.kana_first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end

    it 'ユーザーフリガナ(名字)が存在しても全角（カタカナ）でなければ登録できないこと' do
      @user.kana_family_name = 'abc12あ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana family name is invalid. Input full-width katakana characters.')
    end

    it 'ユーザーフリガナ(名前)が存在しても全角（カタカナ）でなければ登録できないこと' do
      @user.kana_first_name = 'abc12あ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana first name is invalid. Input full-width katakana characters.')
    end

    it '生年月日が空なら登録できないこと' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
