class SessionsController < ApplicationController
  def new
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
end