require 'rails_helper'

describe ReviewsController do
  describe "GET index" do
    context "with authenticated user" do
      it "sets @reviews" do
        set_current_user
        get :index
        review1 = Fabricate(:review, created_at: 1.day.ago)
        review2 = Fabricate(:review)
        expect(assigns(:reviews)).to eq([review2, review1])
      end
    end

    it_behaves_like "require sign in" do
      let(:action) { get :index }
    end
  end
end