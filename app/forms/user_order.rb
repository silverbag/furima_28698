class UserOrder

  include ActiveModel::Model
  # attr_accessor :zip_code, :state, :city, :house_number, :building, :phone_number, :order_id, :user_id, :item_id
  attr_accessor :zip_code, :city_id, :city, :house_number, :building, :phone_number, :item_id, :authenticity_token, :token, :user_id
  with_options presence: true do
    # 郵便番号のバリデーション
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    # validates :state
    validates :city_id
    validates :city
    validates :house_number
    # validates :building
    # 電話番号のバリデーション
    validates :phone_number, format: {with: /\A\d{11}\z/ }
    # validates :order_id
  end

  with_options presence: true do
    # validates :user_id
    validates :item_id
    # validates :price
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    # binding.pry
    Address.create(zip_code: zip_code, city_id: city_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
      end

end