class Trip < ActiveRecord::Base
  belongs_to :user
  belongs_to :start_point, :class_name => 'Station'
  belongs_to :end_point, :class_name => 'Station'
end
