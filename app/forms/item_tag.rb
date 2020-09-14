class ItemTag

  include ActiveModel::Model
  attr_accessor :image, :name, :text, :user_id, :category_id, :status_id, :charge_id, :city_id, :day_id, :price, :tag, :item_id, :tag_id


  with_options presence: true do
    validates :image, presence: { message: "を挿入してください" }
    validates :name, presence: { message: "を入力してください" }
    validates :text, presence: { message: "を入力してください" }
    validates :user_id
    validates :category_id, numericality:{ other_than: 1, message: "カテゴリーを入力してください" }
    validates :status_id, numericality:{ other_than: 1, message: "商品の状態を入力してください" }
    validates :charge_id, numericality:{ other_than: 1, message: "配送料の負担を入力してください" }
    validates :city_id, numericality:{ other_than: 1, message: "発送元の地域を入力してください" }
    validates :day_id, numericality:{ other_than: 1, message: "発送までの日数を入力してください" }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "は¥300~¥9,999,999で設定してください" }
  end

  def save
    @tag = Tag.create(tag: tag)
    # @tag = Tag.where(tag: tag).first_or_initialize
    # @tag.save

    @item = Item.create(image: image, name: name, text: text, user_id: user_id, category_id: category_id, status_id: status_id, charge_id: charge_id, city_id: city_id, day_id: day_id, price: price)
    ItemTagRelation.create(item_id: @item.id, tag_id: @tag.id)
  end
end