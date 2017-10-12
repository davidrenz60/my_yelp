require 'rails_helper'

describe Business do

  it { should have_many(:reviews).order(created_at: :desc) }
  it { should belong_to(:creator).class_name('User').with_foreign_key('user_id') }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip_code) }
  it { should validate_presence_of(:phone_number) }

  describe "#rating" do
    let(:business) { Fabricate(:business) }

    it "returns 0 if there are no reviews" do
      expect(business.rating).to eq(0)
    end

    it "retuns the average rating of the business" do
      Fabricate(:review, business: business, rating: 4)
      Fabricate(:review, business: business, rating: 2)
      expect(business.rating).to eq(3.0)
    end

    it "retuns the average rating rounded to the nearest 0.5" do
      Fabricate(:review, business: business, rating: 4)
      Fabricate(:review, business: business, rating: 3)
      Fabricate(:review, business: business, rating: 1)
      expect(business.rating).to eq(2.5)
    end
  end
end