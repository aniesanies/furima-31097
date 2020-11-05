require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it 'nickname, email, password, password_confirmation, last_name, first_name, last_name_kana, first_name_kana, birthdayが存在すれば登録できること' do
    expect(@user).to be_valid
  end

  it 'nicknameが空の場合登録できないこと' do
    @user.nickname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("ニックネームを入力してください")
  end

  it 'emailが空の場合登録できないこと' do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Eメールを入力してください")
  end

  it 'emailに@を含まない場合登録できないこと' do
    @user.email = 'testtest.com'
    @user.valid?
    expect(@user.errors.full_messages).to include("Eメールは不正な値です")
  end

  it '重複したemailが存在する場合登録できないこと' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
  end

  it 'passwordが空の場合登録できないこと' do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("パスワードを入力してください")
  end

  it 'passwordが6文字以上の場合登録できること' do
    @user.password = 'passw6'
    @user.password_confirmation = 'passw6'
    expect(@user).to be_valid
  end

  it 'passwordが5文字以下の場合登録できないこと' do
    @user.password = 'passw'
    @user.valid?
    expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
  end

  it 'passwordが半角英字のみの場合登録できないこと' do
    @user.password = 'password'
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワードは半角英字と数字の両方を含めてください')
  end

  it 'passwordが半角数字のみの場合登録できないこと' do
    @user.password = '111111'
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワードは半角英字と数字の両方を含めてください')
  end

  it 'passwordが存在してもpassword_confirmationが存在しない場合登録できないこと' do
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
  end

  it 'last_nameが空の場合登録できないこと' do
    @user.last_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("苗字を入力してください")
  end

  it 'last_nameが全角文字でない場合登録できないこと' do
    @user.last_name = 'name'
    @user.valid?
    expect(@user.errors.full_messages).to include('苗字は全角文字を入力してください')
  end

  it 'first_nameが空の場合登録できないこと' do
    @user.first_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("名前を入力してください")
  end

  it 'first_nameが全角文字でない場合登録できないこと' do
    @user.first_name = 'name'
    @user.valid?
    expect(@user.errors.full_messages).to include('名前は全角文字を入力してください')
  end

  it 'last_name_kanaが空の場合登録できないこと' do
    @user.last_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("苗字(カナ)を入力してください")
  end

  it 'alst_name_kanaが全角（カタカナ）でない場合場合登録できないこと' do
    @user.last_name_kana = 'ｶﾀｶﾅ'
    @user.valid?
    expect(@user.errors.full_messages).to include('苗字(カナ)は全角（カタカナ）で入力してください')
  end

  it 'first_name_kanaが空の場合登録できないこと' do
    @user.first_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
  end

  it 'first_name_kanaが全角（カタカナ）でない場合場合登録できないこと' do
    @user.first_name_kana = 'ｶﾀｶﾅ'
    @user.valid?
    expect(@user.errors.full_messages).to include('名前(カナ)は全角（カタカナ）で入力してください')
  end

  it 'birthdayが空の場合登録できないこと' do
    @user.birthday = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("生年月日を入力してください")
  end
end