class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do

    # varidates :name
    # varidates :price
    # varidates :user_id
    # varidates :category_id
    # varidates :status_id
    # varidates :charge_id
    # varidates :city_id
    # varidates :day_id

  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :city
  belongs_to_active_hash :charge
  belongs_to_active_hash :day

end