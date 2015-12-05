class Trip < ActiveRecord::Base
  #before_create :charge_account
  #after_create :open_gate
  belongs_to :user
  belongs_to :start_point, :class_name => 'Station'
  belongs_to :end_point, :class_name => 'Station'
end
