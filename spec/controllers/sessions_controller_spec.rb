require 'rails_helper'

describe SessionsController do
  describe "GET new" do
    it "redirects to the home page for authenticated user" do
      set_current_user
      get :new
      expect(response).to redirect_to home_path
    end
  end

  describe "POST create" do
    context "with valid credentials" do
      let(:user) { Fabricate(:user) }

      before do
        post :create, params: { email: user.email, password: user.password }
      end

      it "sets the session user id" do
        expect(session[:user_id]).to eq(user.id)
      end

      it "redirects to the home page" do
        expect(response).to redirect_to home_path
      end

      it "sets a flash message" do
        expect(flash[:success]).not_to be_nil
      end
    end

    context "with invalid credentials" do
      let(:user) { Fabricate(:user) }

      before do
        post :create, params: { email: user.email, password: user.password + "123" }
      end

      it "does not set the session user id" do
        expect(session[:user_id]).to be_nil
      end

      it "sets a flash message" do
        expect(flash[:danger]).not_to be_nil
      end

      it "redirects to the login page" do
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "GET destroy" do
    before do
      set_current_user
      get :destroy
    end

    it "sets the session user_id to nil" do
      expect(session[:user_id]).to be_nil
    end

    it "sets a flash message" do
      expect(flash[:success]).not_to be_nil
    end

    it "redirects to the login page" do
      expect(response).to redirect_to login_path
    end
  end
end


