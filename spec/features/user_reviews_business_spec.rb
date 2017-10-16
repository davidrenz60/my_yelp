require 'rails_helper'

feature "User reviews a business" do
  let(:user) { Fabricate(:user) }
  let(:business) { Fabricate(:business) }
  let(:review_params) { Fabricate.attributes_for(:review) }

  scenario "with valid input" do
    sign_in(user)

    write_review(business, review_params[:rating], review_params[:body])
    expect(page).to have_content(review_params[:body])

    visit user_path(user)
    expect(page).to have_content(review_params[:body])
  end

  def write_review(business, rating, body)
    visit business_path(business)
    click_link "Write a Review"
    fill_in "review_body", with: body
    select rating, from: 'review_rating'
    click_button "Post Review"
  end
end