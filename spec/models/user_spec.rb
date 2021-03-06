require 'rails_helper'

describe User do
  it { should have_secure_password }
  it { should have_many(:reviews).order(created_at: :desc) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }

  describe "#display_name" do
    let(:jon) { Fabricate(:user, first_name: "Jon", last_name: "Doe") }
    let(:alice) { Fabricate(:user, first_name: "alice", last_name: "smith") }

    it "returns the first name and the first initial of the last name followed by a period" do
      expect(jon.display_name).to eq("Jon D.")
    end

    it "capitalizes the first name and last name inital" do
      expect(alice.display_name).to eq("Alice S.")
    end
  end
end