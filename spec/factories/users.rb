FactoryBot.define do
  factory :user do
    first_name { Faker::Dog.name }
    last_name { Faker::Artist.name }
    address { Faker::Providers.address}
    email { Faker::Internet.email }
    city { Faker::Providers.city }
    state { Faker::Providers.state }
    zip { Faker::Providers.zip }
    phone { Faker::Providers.phone_number }
    email { Faker::Internet.safe_email }
  end
end
