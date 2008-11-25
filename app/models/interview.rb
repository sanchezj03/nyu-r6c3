# == Schema Information
# Schema version: 51
#
# Table name: interviews
#
#  child_id   :integer       
#  comments   :string(255)   
#  created_at :datetime      
#  id         :integer       not null, primary key
#  status     :string(255)   
#  type       :string(255)   
#  updated_at :datetime      
#

class Interview < ActiveRecord::Base
	validates_presence_of :type, :status, :comments
end
