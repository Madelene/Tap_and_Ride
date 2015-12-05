class AddStartAndEndPointToTrip < ActiveRecord::Migration
  def change
  	add_column :users, :start_point, :integer
  	add_column :users, :end_point, :integer
  end
end
