FactoryBot.define do
  factory :item do
    name { '田中' }
    price { '300' }
    user_id { '1' }
    category_id { '1' }
    status_id { '1' }
    charge_id { '1' }
    city_id { '1' }
    day_id { '1' }
    association :user
  end
end
