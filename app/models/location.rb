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

class Location < ActiveRecord::Base
  belongs_to :child
  belongs_to :classroom
  belongs_to :location_status, :foreign_key => 'status_id'
  has_one :lost_data_completion_reason, :foreign_key => 'lost_spring'
  
  validates_presence_of :classroom_id, :if => Proc.new{ |location| location.status_id == "1"}
  validates_presence_of :status_id
  
  attr_accessor :school_id
	
	def anticipated?
		anticipated_location.eql?(1)
	end
  
	def lost_in_spring?
		lost_spring.eql?(1)
	end
	
	def lost_in_fall?
		lost_fall.eql?(1)
	end
	
	def lost_reason
		#lost_in_spring? ? lost_spring_reason : (lost_in_fall? ? lost_fall_reason : nil)
		lost_in_spring? ? lost_spring_reason : (lost_in_fall? ? lost_fall_reason: nil)
	end
	
	def lost_spring_reason
		LostDataCompletionReason.find(lost_spring_id).reason if lost_spring_id
	end
	
	def lost_fall_reason
		LostDataCompetionReason.find(lost_fall_id).reason if lost_fall_id
	end
  
	def type_only
		type.to_s[0, type.to_s.index("Location")]
	end

	def teacher_other
		teacher_ln_other + ", " + teacher_fn_other
	end
	
	def before_create
		if !status_id.blank?
			status = LocationStatus.find(status_id)
			write_attribute(:classroom_id, nil) if !status.in_target_school?
		end
	end
end
