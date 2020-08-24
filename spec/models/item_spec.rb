require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'ユーザー認証' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '画像は1枚必須であること(ActiveStorageを使用すること)' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank", "User can't be blank")
    end
    it '商品名が必須であること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態についての情報が必須であること' do
      @item.status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it '配送料の負担についての情報が必須であること' do
      @item.charge = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge can't be blank")
    end
    it '発送元の地域についての情報が必須であること' do
      @item.city = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("City can't be blank")
    end
    it '発送までの日数についての情報が必須であること' do
      @item.day = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end
    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = 299
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank", 'Price must be less than or equal to 9999999', "User can't be blank")
    end
  end
end
