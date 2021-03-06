class SessionsController < ApplicationController
  def new
    redirect_to home_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.first_name}! You are logged in."
      redirect_to home_path
    else
      flash[:danger] = "Invalid email or password. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    flash[:success] = "You have logged out."
    session[:user_id] = nil
    redirect_to login_path
  end
end