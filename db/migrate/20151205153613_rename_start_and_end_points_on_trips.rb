class RenameStartAndEndPointsOnTrips < ActiveRecord::Migration
  def change
    rename_column :trips, :start_point, :start_point_id
    rename_column :trips, :end_point, :end_point_id
  end
end
