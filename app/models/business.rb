class Business < ActiveRecord::Base
  has_many :reviews, -> { order(created_at: :desc) }
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  validates_presence_of :name, :address, :city, :state, :zip_code, :phone_number
end