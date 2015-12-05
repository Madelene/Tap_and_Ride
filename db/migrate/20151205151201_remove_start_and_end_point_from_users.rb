class RemoveStartAndEndPointFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :start_point, :integer
    remove_column :users, :end_point, :integer
  end
end
