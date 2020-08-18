class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do

    validates :name
    validates :text
    validates :price
    validates :user_id
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :city_id
    validates :day_id
    
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :city
  belongs_to_active_hash :charge
  belongs_to_active_hash :day

end