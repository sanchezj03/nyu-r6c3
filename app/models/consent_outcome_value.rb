# == Schema Information
# Schema version: 51
#
# Table name: consent_outcome_values
#
#  created_at :datetime      
#  id         :integer       not null, primary key
#  outcome    :string(255)   
#  updated_at :datetime      
#

class ConsentOutcomeValue < ActiveRecord::Base
end
