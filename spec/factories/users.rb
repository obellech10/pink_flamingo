FactoryBot.define do
  factory :user do
<<<<<<< HEAD
    first_name { 'Baxter' }
    last_name { 'McDog' }
    address { "1234 Hello Ave"}
    city { "Denver" }
    state { "CO" }
    zip { 80802 }
    phone { "415-999-0987" }
    email { "baxter@gmail.com" }
=======
    name { Faker::Dog.name }
    address { Faker::Providers.address}
    email { Faker::Internet.email }
    city { Faker::Providers.city }
    state { Faker::Providers.state }
    zip { Faker::Providers.zip }
    phone { Faker::Providers.phone_number }
    email { Faker::Internet.safe_email }
>>>>>>> e81f346e72753b4de07d8e6fdc5dda14f733381d
  end
end
