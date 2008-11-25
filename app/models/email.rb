# == Schema Information
# Schema version: 51
#
# Table name: emails
#
#  caregiver_id :integer       
#  created_on   :datetime      
#  email        :string(255)   
#  id           :integer       not null, primary key
#  user_id      :integer       
#

class Email < ActiveRecord::Base
  belongs_to :caregiver
  belongs_to :user
  
  #validates_as_email :email
end
