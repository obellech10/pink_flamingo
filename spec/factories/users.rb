FactoryBot.define do
  factory :user do
    first_name { 'Baxter' }
    last_name { 'McDog' }
    address { "1234 Hello Ave"}
    city { "Denver" }
    state { "CO" }
    zip { 80802 }
    phone { "415-999-0987" }
    email { "baxter@gmail.com" }
  end
end
