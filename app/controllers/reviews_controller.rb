class ReviewsController < ApplicationController
  before_action :require_user

  def index
    @reviews = Review.all.order(created_at: :desc)
  end
end