class AddRatingToBusinesses < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :rating, :float
  end
end
