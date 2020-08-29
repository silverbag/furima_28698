class Address < ApplicationRecord
  belongs_to :order

  # with_options presence: true do
  #   validates :zip_code
  #   validates :state
  #   validates :city
  #   validates :house_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #   # validates :building
  #   validates :phone_number, format: {with: 
  #   validates :order_id
end
