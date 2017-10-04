require 'rails_helper'

describe Business do
  it { should have_many(:reviews) }
end