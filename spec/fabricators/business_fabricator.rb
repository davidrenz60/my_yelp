Fabricator(:business) do
  creator { Fabricate(:user) }
  name { Faker::Lorem.words(2, true).join(" ") }
  address { Faker::Address.street_address }
  city { Faker::Address.city }
  state { Faker::Address.state_abbr }
  zip_code { Faker::Address.zip_code }
  phone_number { Faker:: Number.number(10) }
end