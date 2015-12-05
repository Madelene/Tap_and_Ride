class AddStartAndEndPointsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :start_point, :integer
    add_column :trips, :end_point, :integer
  end
end
