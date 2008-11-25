# == Schema Information
# Schema version: 51
#
# Table name: consent_outcomes
#
#  caregiver_id :integer       
#  child_id     :integer       
#  collected_on :datetime      
#  comments     :text          
#  consented    :boolean       
#  created_at   :datetime      
#  id           :integer       not null, primary key
#  updated_at   :datetime      
#  value        :string(255)   
#  withdrawn    :integer       
#

class ConsentOutcome < ActiveRecord::Base
	validates_presence_of :caregiver_id
	
	belongs_to :caregiver
end
