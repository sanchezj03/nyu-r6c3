# == Schema Information
# Schema version: 51
#
# Table name: location_statuses
#
#  id               :integer       not null, primary key
#  in_target_school :integer       
#  text             :string(255)   
#

class LocationStatus < ActiveRecord::Base
end
