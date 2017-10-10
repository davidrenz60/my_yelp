class Review < ActiveRecord::Base
  belongs_to :business
  belongs_to :user
  validates_presence_of :body, :rating
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 5
  }

  def preview
    body.truncate_words(30)
  end
end