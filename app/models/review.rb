class Review < ActiveRecord::Base
  belongs_to :business
  validates_presence_of :body

  def preview
    body.truncate_words(30)
  end
end