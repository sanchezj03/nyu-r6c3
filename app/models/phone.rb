# == Schema Information
# Schema version: 51
#
# Table name: phones
#
#  caregiver_id :integer       
#  collected_on :datetime      
#  comments     :string(510)   
#  created_on   :datetime      
#  id           :integer       not null, primary key
#  mode         :string(16)    
#  number       :string(510)   
#  user_id      :integer       
#

class Phone < ActiveRecord::Base
  belongs_to :caregiver
  belongs_to :user
  
  validates_presence_of :mode
  validates_presence_of :number
  
  def self.find_by_mode (mode)
    self.find(:first, :conditions => { :mode => mode}, :order => 'created_on DESC')
  end
  
  def mode= (value)
    write_attribute(:mode, value.downcase)
  end
  
  def mode
    read_attribute(:mode).downcase if read_attribute(:mode)
  end
  
  def has_comments?
    comments != ""
  end
end
