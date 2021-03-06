class BusinessesController < ApplicationController
  before_action :require_user

  def index
    @businesses = Business.order_by_rating(Business.all)
  end

  def show
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    @business.creator = current_user

    if @business.save
      flash[:success] = "Your business was created. Write a review!"
      redirect_to business_path(@business)
    else
      render :new
    end
  end

  def search
    results = Business.search_by_name(params[:search_term])
    @businesses = Business.order_by_rating(results)
  end

  private

  def business_params
    params.require(:business).permit(:name, :address, :city, :state, :zip_code, :phone_number)
  end
end