require 'rails_helper'

describe ReviewsController do
  describe "GET index" do
    context "with authenticated user" do
      let!(:review1) { Fabricate(:review, created_at: 1.day.ago) }
      let!(:review2) { Fabricate(:review) }

      it "sets @reviews" do
        set_current_user
        get :index
        expect(assigns(:reviews)).to eq([review2, review1])
      end
    end

    it_behaves_like "require sign in" do
      let(:action) { get :index }
    end
  end

  describe "GET new" do
    context "with authenticated user" do
      let(:business) { Fabricate(:business) }

      before do
        set_current_user
        get :new, params: { business_id: business.id }
      end

      it "sets @review" do
        expect(assigns(:review)).to be_a_new(Review)
      end

      it "sets @business" do
        expect(assigns(:business)).to eq(business)
      end
    end

    it_behaves_like "require sign in" do
      let(:business) { Fabricate(:business) }
      let(:action) { get :new, params: { business_id: business.id } }
    end
  end

  describe "POST create" do
    context "with authenticated user" do
      before { set_current_user }

      context "with valid input" do
        let(:business) { Fabricate(:business) }
        let(:review_params) { { rating: 3, body: "Good place!" } }

        before do
          post :create, params: { business_id: business.id, review: review_params }
        end

        it "creates a new review" do
          expect(Review.count).to eq(1)
        end

        it "redirects to the associated business page" do
          expect(response).to redirect_to business_path(business)
        end

        it "sets a flash message" do
          expect(flash[:success]).not_to be_nil
        end
      end

      context "with invalid input" do
        let(:business) { Fabricate(:business) }
        let(:review_params) { { rating: 3 } }

        before do
          post :create, params: { business_id: business.id, review: review_params }
        end

        it "does not create a new review" do
          expect(Review.count).to eq(0)
        end

        it "renders the new template" do
          expect(response).to render_template(:new)
        end
      end
    end
  end
end