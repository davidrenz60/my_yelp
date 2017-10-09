class ReviewsController < ApplicationController
  before_action :require_user

  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  def new
    @review = Review.new
    @business = Business.find(params[:business_id])
  end

  def create
    @business = Business.find(params[:business_id])
    @review = @business.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      flash[:success] = "Your review was created."
      redirect_to business_path(@business)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end