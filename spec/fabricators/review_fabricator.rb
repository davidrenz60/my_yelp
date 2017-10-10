Fabricator(:review) do
  user
  business
  body { Faker::Lorem.paragraph }
  rating {Faker::Number.between(1, 5) }
end