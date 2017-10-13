require 'rails_helper'

feature "User signs in" do
  scenario "with valid credentials" do
    alice = Fabricate(:user)
    sign_in(alice)
    expect(page).to have_content(alice.display_name)
  end
end
