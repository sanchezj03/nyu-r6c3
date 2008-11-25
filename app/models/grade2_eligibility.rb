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

class Grade2Eligibility < Eligibility
	def self.type_name
		"2nd Grade"
	end
end
