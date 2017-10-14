require 'rails_helper'

feature "User adds a business" do
  scenario "with valid input" do
    business_params = Fabricate.attributes_for(:business)

    sign_in
    find("a[href='/businesses/new']").click

    fill_in_new_business_form(business_params)
    add_business

    expect(page).to have_content(business_params[:name])
  end

  scenario "with invalid input" do
    business_params = { name: "Testing" }

    sign_in
    find("a[href='/businesses/new']").click

    fill_in_new_business_form(business_params)
    add_business

    expect(page).to have_content("Add a New Business")
  end

  def fill_in_new_business_form(params)
    fill_in "Business Name", with: params[:name]
    fill_in "Address", with: params[:address]
    fill_in "City", with: params[:city]
    fill_in "State", with: params[:state]
    fill_in "Zip Code", with: params[:zip_code]
    fill_in "Phone Number", with: params[:phone_number]
  end

  def add_business
    click_button "Add Busines"
  end
end