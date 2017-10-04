require 'rails_helper'

describe BusinessesController do
  describe "GET index" do
    it 'sets @business' do
      saison = Fabricate(:business)
      french_laundry = Fabricate(:business)
      get :index
      expect(assigns(:businesses)).to eq([saison, french_laundry])
    end
  end
end
