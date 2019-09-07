FactoryBot.define do
   factory :user do
     title { "Its my Partaaaaay!" }
     date { "12/4/19" }
     time { "5 pm" }
     address { "1234 Hello Ave"}
     event_type { "Grilling" }
     food { true }
     booze { true }
     restrictions { "Dont bring your lame kids." }
     radius { 600.0 }
   end
end
