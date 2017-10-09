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
end