# == Schema Information
# Schema version: 51
#
# Table name: addresses
#
#  apartment    :string(100)   
#  caregiver_id :integer       
#  city         :string(100)   
#  collected_on :datetime      
#  comments     :string(1000)  
#  country      :string(100)   
#  created_on   :datetime      
#  dt           :string(100)   
#  home_number  :string(100)   
#  id           :integer       not null, primary key
#  state        :string(100)   
#  street       :string(510)   
#  user_id      :integer       
#  zip_code     :string(100)   
#

class Address < ActiveRecord::Base
  belongs_to :caregiver
  belongs_to :user
  
  validates_presence_of :street #, :city, :state
  validates_length_of :state, :minimum => 2
  #validates_numericality_of :zip_code, :if => :zip_code
  
  # Default values ...
  def home_number= (value)
    write_attribute(:home_number, value == "House Number" ? "" : value)
  end
    
  def street= (value)
    write_attribute(:street, value == "Street" ? "" : value)
  end
  
  def apartment= (value)
    write_attribute(:apartment, value == "Apartment Number" ? "" : value)
  end
  
  def zip_code= (value)
    write_attribute(:zip_code, value == "Zip Code" ? "" : value)
  end
  
  def to_s
    apt = "(Apt # #{apartment})" unless apartment.empty?
    "#{home_number} #{street}, #{city}, #{state} #{zip_code} #{apt} #{comments}" 
  end
end
