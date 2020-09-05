require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品購入機能' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it 'クレジットカード情報は必須であること' do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
    it '配送先の情報として、郵便番号が必須であること' do
      @user_order.zip_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("郵便番号を入力してください")
    end
    it '配送先の情報として、都道府県が必須であること' do
      @user_order.city_id = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("都道府県を入力してください")
    end
    it '配送先の情報として、市区町村が必須であること' do
      @user_order.city = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("市区町村を入力してください")
    end
    it '配送先の情報として、番地が必須であること' do
      @user_order.house_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("番地を入力してください")
    end
    it '配送先の情報として、電話番号が必須であること' do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("電話番号を入力してください")
    end
    it '電話番号にはハイフンは不要で、11桁以内であること' do
      @user_order.phone_number = "090888899999"
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("電話番号を入力してください")
    end    
  end
end
