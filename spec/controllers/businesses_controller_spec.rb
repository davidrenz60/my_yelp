require 'rails_helper'

describe BusinessesController do
  describe "GET index" do
    context 'with authenticated user' do
      it 'sets @business' do
        set_current_user
        saison = Fabricate(:business)
        french_laundry = Fabricate(:business)
        get :index
        expect(assigns(:businesses)).to eq([saison, french_laundry])
      end
    end

    it_behaves_like "require sign in" do
      let(:action) { get :index }
    end
  end
end
