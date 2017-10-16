require 'rails_helper'

feature "User signs in" do
  let(:alice) { Fabricate(:user) }

  scenario "with valid credentials" do
    sign_in(alice)
    expect(page).to have_content(alice.display_name)
  end
end
