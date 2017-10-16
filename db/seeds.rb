jon = Fabricate(:user, first_name: "Jon", last_name: "Doe", email: "jon@test.com", password: "jon")
alice = Fabricate(:user, first_name: "Alice", last_name: "Smith", email: "alice@test.com", password: "alice")
bob = Fabricate(:user, first_name: "Bob", last_name: "Jones", email: "bob@test.com", password: "bob")
users = [jon, alice, bob]

french_laundry = Fabricate(:business, name: "The French Laundry", creator: alice)
saison = Fabricate(:business, name: "Saison", creator: alice)
acquerello = Fabricate(:business, name: "Acquerello", creator: bob)
businesses = [french_laundry, saison, acquerello]

10.times { Fabricate(:review, user: users.sample, business: businesses.sample) }
5.times { Fabricate(:review) }