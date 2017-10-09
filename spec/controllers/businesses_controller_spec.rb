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

  describe "GET show" do
    context "with authenticated user" do
      it "sets @business" do
        set_current_user
        business = Fabricate(:business)
        get :show, params: { id: business.id }
        expect(assigns(:business)).to eq(business)
      end
    end

    it_behaves_like "require sign in" do
      let(:action) { get :index }
    end
  end

  describe "GET new" do
    context "with authenticated user" do
      it "sets @business" do
        set_current_user
        get :new
        expect(assigns(:business)).to be_a_new(Business)
      end
    end

    it_behaves_like "require sign in" do
      let(:action) { get :index }
    end
  end

  describe "POST create" do
    context "with authenticated user" do

      before do
        set_current_user
        post :create, params: { business: business_params }
      end

      context "with valid input" do
        let(:business_params) { Fabricate.attributes_for(:business) }

        it "creates a new business" do
          expect(Business.count).to eq(1)
        end

        it "redirects to the page of the new business" do
          expect(response).to redirect_to business_path(assigns(:business))
        end

        it "sets a flash message" do
          expect(flash[:success]).not_to be_nil
        end
      end

      context "with invalid input" do
        let(:business_params) { { name: "French Laundry" } }

        before do
          set_current_user
          post :create, params: { business: business_params }
        end

        it "does not create a new business" do
          expect(Business.count).to eq(0)
        end

        it "renders the new template" do
          expect(response).to render_template(:new)
        end
      end
    end

    it_behaves_like "require sign in" do
      let(:action) { post :create }
    end
  end
end
