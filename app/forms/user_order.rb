class UserOrder

  include ActiveModel::Model
  # attr_accessor :zip_code, :state, :city, :house_number, :building, :phone_number, :order_id, :user_id, :item_id
  attr_accessor :zip_code, :city_id, :city, :house_number, :building, :phone_number, :item_id, :token, :user_id, :authenticity_token

  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "郵便番号を入力してください"}
    # validates :state
    validates :city_id, presence: { message: "を入力してください" }
    validates :city, presence: { message: "を入力してください" }
    validates :house_number, presence: { message: "を入力してください" }
    # validates :building
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "を入力してください" }
    validates :token, presence: { message: "を入力してください" }
    validates :authenticity_token
  end

  with_options presence: true do
    validates :user_id
    validates :item_id
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, city_id: city_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end

end