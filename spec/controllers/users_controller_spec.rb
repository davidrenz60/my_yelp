require 'rails_helper'

describe UsersController do
  describe "GET new" do
    it "sets @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST create" do
    context "with valid input" do
      let(:user_params) { Fabricate.attributes_for(:user) }

      before do
        post :create, params: { user: user_params }
      end

      it "creates a new user" do
        expect(User.count).to eq(1)
      end

      it "redirects to the sign in page" do
        expect(response).to redirect_to login_path
      end

      it "sets a flash message" do
        expect(flash[:success]).not_to be_nil
      end
    end

    context "with invalid input" do
      before do
        post :create, params: { user: { first_name: "Jon", last_name: "Doe" } }
      end

      it "does not create a new user" do
        expect(User.count).to eq(0)
      end

      it "renders the new template" do
        expect(response).to render_template(:new)
      end

      it "sets @user" do
        expect(assigns(:user)).to be_a_new(User)
      end
    end
  end
end
