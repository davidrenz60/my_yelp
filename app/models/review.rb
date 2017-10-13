class Review < ActiveRecord::Base
  belongs_to :business
  belongs_to :user
  validates_presence_of :body, :rating
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 5
  }

  after_save :update_business_rating

  def preview
    body.truncate_words(30)
  end

  private

  def update_business_rating
    business.update_rating
  end
end