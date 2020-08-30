require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品購入機能' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it 'クレジットカード情報は必須であること' do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
    it '配送先の情報として、郵便番号が必須であること' do
      @user_order.zip_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Zip code can't be blank", "Zip code is invalid. Include hyphen(-)")
    end
    it '配送先の情報として、都道府県が必須であること' do
      @user_order.city_id = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end
    it '配送先の情報として、市区町村が必須であること' do
      @user_order.city = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end
    it '配送先の情報として、番地が必須であること' do
      @user_order.house_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("House number can't be blank")
    end
    it '配送先の情報として、電話番号が必須であること' do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号にはハイフンは不要で、11桁以内であること' do
      @user_order.phone_number = "090888899999"
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number is invalid")
    end    
  end
end
