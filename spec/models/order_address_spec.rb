require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@order_address).to be_valid
  end

  it 'building_nameが存在していないなくても保存できること' do
    @order_address.building_name = nil
    expect(@order_address).to be_valid
  end

  it 'postal_codeが存在していない場合保存できないこと' do
    @order_address.postal_code = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('郵便番号を入力してください')
  end

  it 'postal_codeにハイフンが含まれていない場合保存できないこと' do
    @order_address.postal_code = '123456'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('郵便番号はハイフン(-)を含んで記述してください')
  end

  it 'prefecture_idが存在していない場合保存できないこと' do
    @order_address.prefecture_id = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('都道府県を入力してください')
  end

  it 'prefecture_idが1の場合保存できないこと' do
    @order_address.prefecture_id = 1
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('都道府県を選択してください')
  end

  it 'cityが存在していない場合保存できないこと' do
    @order_address.city = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('市区町村を入力してください')
  end

  it 'house_numberが存在していない場合保存できないこと' do
    @order_address.house_number = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('番地を入力してください')
  end

  it 'phone_numberが存在していない場合保存できないこと' do
    @order_address.phone_number = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('電話番号を入力してください')
  end

  it 'phone_numberが半角数字でない場合保存できないこと' do
    @order_address.phone_number = '０９０１２３４５６７８'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('電話番号は10桁か11桁の半角数字でハイフン(-)なしで入力してください')
  end

  it 'phone_numberが9桁以下の場合保存できないこと' do
    @order_address.phone_number = '090123456'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('電話番号は10桁か11桁の半角数字でハイフン(-)なしで入力してください')
  end

  it 'phone_numberが12桁以上の場合保存できないこと' do
    @order_address.phone_number = '090123456789'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('電話番号は10桁か11桁の半角数字でハイフン(-)なしで入力してください')
  end

  it 'phone_numberがハイフン(-)を含む場合保存できないこと' do
    @order_address.phone_number = '090-1234-5678'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('電話番号は10桁か11桁の半角数字でハイフン(-)なしで入力してください')
  end

  it 'tokenが存在していない場合保存できないこと' do
    @order_address.token = nil
    @order_address.valid?
    expect(@order_address.errors.full_messages).to include('クレジットカード情報を入力してください')
  end
end
