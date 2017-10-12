french_laundry = Business.create(name: "The French Laundry", address: "1234 main st", city: "San Francisco", state: "CA", zip_code: "94115", phone_number: "4151234567")

saison = Business.create(name: "Saison", address: "1234 main st", city: "San Francisco", state: "CA", zip_code: "94115", phone_number: "4151234567")

acquerello = Business.create(name: "Acquerello", address: "1234 main st", city: "San Francisco", state: "CA", zip_code: "94115", phone_number: "4151234567")

jon = User.create(first_name: "Jon", last_name: "Doe", email: "jon@test.com", password: "jon")
alice = User.create(first_name: "Alice", last_name: "Smith", email: "alice@test.com", password: "alice")

Review.create(rating: 4, business: french_laundry, body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget erat eleifend, efficitur ligula vel, bibendum dolor. Aliquam erat volutpat. Morbi aliquet, sem volutpat vehicula faucibus, lorem dolor varius dui, non interdum arcu diam nec.", user: jon)

Review.create(rating: 2, business: french_laundry, body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In malesuada tempus eros eget feugiat. In at malesuada augue. Praesent tristique gravida turpis ut facilisis. Sed id ornare leo. Morbi mattis ullamcorper suscipit. Morbi eget vehicula.", user: alice)

Review.create(rating: 4, business: saison, body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In malesuada tempus eros eget feugiat. In at malesuada augue. Praesent tristique gravida turpis ut facilisis. Sed id ornare leo. Morbi mattis ullamcorper suscipit. Morbi eget vehicula.", user: jon)

Review.create(rating: 3, business: saison, body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In malesuada tempus eros eget feugiat. In at malesuada augue. Praesent tristique gravida turpis ut facilisis. Sed id ornare leo. Morbi mattis ullamcorper suscipit. Morbi eget vehicula.", user: alice)

Review.create(rating: 1, business: saison, body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In malesuada tempus eros eget feugiat. In at malesuada augue. Praesent tristique gravida turpis ut facilisis. Sed id ornare leo. Morbi mattis ullamcorper suscipit. Morbi eget vehicula.", user: jon)
