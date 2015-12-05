class ChangeName < ActiveRecord::Migration	
  def change
    rename_table :appointments, :users
  end
end
