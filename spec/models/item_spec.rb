require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'ユーザー認証' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '画像は1枚必須であること(ActiveStorageを使用すること)' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("出品画像を挿入してください")
    end
    it '商品名が必須であること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end
    it '商品の説明が必須であること' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
    end
    it '商品の状態についての情報が必須であること' do
      @item.status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を入力してください")
    end
    it '配送料の負担についての情報が必須であること' do
      @item.charge = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
    end
    it '発送元の地域についての情報が必須であること' do
      @item.city = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
    end
    it '発送までの日数についての情報が必須であること' do
      @item.day = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
    end
    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("価格を入力してください")
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = 299
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は¥300~¥9,999,999で設定してください")
    end
  end
end
