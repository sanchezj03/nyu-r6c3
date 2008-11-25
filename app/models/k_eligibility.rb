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

class KEligibility < Eligibility
	def self.type_name
		"Kindergarten"
	end
end
