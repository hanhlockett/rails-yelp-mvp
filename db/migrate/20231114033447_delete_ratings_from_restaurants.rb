class DeleteRatingsFromRestaurants < ActiveRecord::Migration[7.0]
  def change
    remove_column :restaurants, :rating
  end
end
