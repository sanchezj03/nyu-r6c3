# == Schema Information
# Schema version: 51
#
# Table name: eligibilities
#
#  child_id     :integer       
#  cohort       :integer       
#  collected_on :datetime      
#  comments     :string(255)   
#  created_on   :datetime      
#  eligible     :integer       
#  id           :integer       not null, primary key
#  reason_id    :integer       
#  type         :string(20)    
#  user_id      :integer       
#

class Eligibility < ActiveRecord::Base
	belongs_to :child
	belongs_to :user
	belongs_to :reason, :class_name => :eligilibity_reason, :foreign_key => 'reason_id'
	belongs_to :eligibility_reason, :foreign_key => 'reason_id'
  
	validates_presence_of :child_id
	validates_inclusion_of :eligible, :in => [true, false, 1, 0]
	validates_presence_of :reason_id

	attr_accessor :eligible_reason_id, :not_eligible_reason_id
	
	def eligible_reason_id=(new_reason_id)
		write_attribute(:reason_id, new_reason_id) if eligible?
	end
	
	def not_eligible_reason_id=(new_reason_id)
		write_attribute(:reason_id, new_reason_id) if not_eligible?
	end
	
	def eligible_reason_id
		reason_id if eligible?
	end
	
	def not_eligible_reason_id
		reason_id if not_eligible?
	end
	
	def not_eligible?
		!eligible?
	end
	
	def eligible?
		read_attribute(:eligible) == 1 ? true : false
	end
	
	#alias_method :not_eligible, 'not_eligible?'
	#alias_method :eligible, 'eligible?'
end
