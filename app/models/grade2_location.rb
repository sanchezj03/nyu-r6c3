# == Schema Information
# Schema version: 51
#
# Table name: locations
#
#  anticipated_location :integer       
#  child_id             :integer       
#  classroom_id         :integer       
#  collected_on         :datetime      
#  comments             :string(255)   
#  created_on           :datetime      
#  id                   :integer       not null, primary key
#  lost_fall            :integer       
#  lost_fall_id         :integer       
#  lost_spring          :integer       
#  lost_spring_id       :integer       
#  now                  :string(100)   
#  school_id            :integer       
#  school_other         :string(170)   
#  status_id            :string(255)   
#  teacher_fn_other     :string(50)    
#  teacher_ln_other     :string(50)    
#  type                 :string(20)    not null
#  user_id              :integer       
#

class Grade2Location < Location
	def self.type_name
		"2nd Grade"
	end
end
