# == Schema Information
# Schema version: 51
#
# Table name: consent_reasons
#
#  id     :integer       not null, primary key
#  number :integer       
#  reason :string(255)   
#  yes    :integer       
#

class ConsentReason < ActiveRecord::Base
  has_many :consents
end
