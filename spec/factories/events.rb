FactoryBot.define do
  factory :event do
    title { 'Book Club' }
    date { "10-13-19" }
    time { "8:00pm" }
    address { "123 Main St" }
    food { false }
    booze { false }
    user
  end
end
