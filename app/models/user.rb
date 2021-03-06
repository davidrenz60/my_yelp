class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, -> { order(created_at: :desc) }
  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email

  def display_name
    "#{first_name.capitalize} #{last_name[0].capitalize}."
  end
end