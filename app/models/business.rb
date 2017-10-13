class Business < ActiveRecord::Base
  default_scope { order('rating DESC NULLS LAST') }
  has_many :reviews, -> { order(created_at: :desc) }
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  validates_presence_of :name, :address, :city, :state, :zip_code, :phone_number

  def self.search_by_name(name)
    return [] if name.blank?
    Business.where("NAME LIKE ?", "%#{name}%")
  end

  def update_rating
    average = reviews.average(:rating).round(1)
    update(rating: average)
  end
end