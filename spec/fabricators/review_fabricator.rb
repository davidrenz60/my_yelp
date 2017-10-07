Fabricator(:review) do
  user
  business
  body { Faker::Lorem.paragraph }
end