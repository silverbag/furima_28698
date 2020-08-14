FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    f_furigana { Faker::Name.name }
    l_furigana { Faker::Name.name }
    birthday { Faker::Date.birthday }
  end
end
