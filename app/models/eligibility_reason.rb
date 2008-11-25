# == Schema Information
# Schema version: 51
#
# Table name: eligibility_reasons
#
#  cohort   :integer       
#  eligible :integer       
#  id       :integer       not null, primary key
#  number   :integer       
#  reason   :string(255)   
#

class EligibilityReason < ActiveRecord::Base
  has_many :eligibilities
end
