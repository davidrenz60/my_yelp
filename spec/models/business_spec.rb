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

  describe "default scope" do
    let(:saison) { Fabricate(:business, name: "saison") }
    let(:french_laundry) { Fabricate(:business, name: "French Laundry") }

    it 'orders the businesses by rating highest to lowest' do
      Fabricate(:review, business: saison, rating: 1)
      Fabricate(:review, business: french_laundry, rating: 4)
      expect(Business.all).to eq([french_laundry, saison])
    end

    it 'puts businesses with no reviews last' do
      Fabricate(:review, business: saison, rating: 4)
      expect(Business.all).to eq([saison, french_laundry])
    end
  end

  describe ".search_by_name" do
    it "returns an empty array when no results are found" do
      Fabricate(:business, name: "Saison")
      Fabricate(:business, name: "French Laundry")
      expect(Business.search_by_name("Acquerello")).to eq([])
    end

    it "returns an array of businesses when name is matched" do
      saison = Fabricate(:business, name: "Saison")
      Fabricate(:business, name: "French Laundry")
      expect(Business.search_by_name("Saison")).to eq([saison])
    end

    it "returns an array of businesses when name is partially matched" do
      french_laundry = Fabricate(:business, name: "French Laundry")
      Fabricate(:business, name: "Saison")
      expect(Business.search_by_name("French")).to eq([french_laundry])
    end

    it "returns an empty array when search is an empty string" do
      Fabricate(:business, name: "Saison")
      Fabricate(:business, name: "French Laundry")
      expect(Business.search_by_name("")).to eq([])
    end
  end

  describe "#update_rating" do
    context "when reviews are created" do
      let(:business) { Fabricate(:business) }

      it "sets the rating to the average rating of assocaited reviews" do
        Fabricate(:review, business: business, rating: 4)
        Fabricate(:review, business: business, rating: 2)
        expect(business.reload.rating).to eq(3)
      end

      it "sets the average rating rounded to one decimal place" do
        Fabricate(:review, business: business, rating: 4)
        Fabricate(:review, business: business, rating: 3)
        Fabricate(:review, business: business, rating: 1)
        expect(business.reload.rating).to eq(2.7)
      end
    end
  end
end
