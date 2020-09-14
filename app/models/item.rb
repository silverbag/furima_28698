class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  has_many :messages
  has_many :tags, through: :item_tag_relations
  has_many :item_tag_relations
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :city
  belongs_to_active_hash :charge
  belongs_to_active_hash :day

  # with_options presence: true do
  #   validates :image, presence: { message: "を挿入してください" }
  #   validates :name, presence: { message: "を入力してください" }
  #   validates :text, presence: { message: "を入力してください" }
  #   validates :user_id
  #   validates :category_id, numericality:{ other_than: 1, message: "カテゴリーを入力してください" }
  #   validates :status_id, numericality:{ other_than: 1, message: "商品の状態を入力してください" }
  #   validates :charge_id, numericality:{ other_than: 1, message: "配送料の負担を入力してください" }
  #   validates :city_id, numericality:{ other_than: 1, message: "発送元の地域を入力してください" }
  #   validates :day_id, numericality:{ other_than: 1, message: "発送までの日数を入力してください" }
  #   validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "は¥300~¥9,999,999で設定してください" }
  # end

end
