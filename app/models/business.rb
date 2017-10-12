class Business < ActiveRecord::Base
  has_many :reviews, -> { order(created_at: :desc) }
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  validates_presence_of :name, :address, :city, :state, :zip_code, :phone_number

  def rating
    return nil if reviews.empty?
    avg = reviews.average(:rating)
    (avg * 2).round / 2.0
  end
end