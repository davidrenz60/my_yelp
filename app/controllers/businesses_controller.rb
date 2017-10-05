class BusinessesController < ApplicationController
  before_action :require_user

  def index
    @businesses = Business.all
  end
end