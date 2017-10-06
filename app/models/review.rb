class Review < ActiveRecord::Base
  belongs_to :business
  belongs_to :user
  validates_presence_of :body

  def preview
    body.truncate_words(30)
  end
end