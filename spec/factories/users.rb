FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    firstname { "太郎" }
    lastname { "太郎" }
    f_furigana { "タロウ" }
    l_furigana { "タロウ" }
    birthday { "1999.01.01" }
  end
end
