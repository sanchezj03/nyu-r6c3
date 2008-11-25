# == Schema Information
# Schema version: 51
#
# Table name: caregivers
#
#  caregiver_id          :string(11)    
#  caregiver_relation_id :integer       
#  child_id              :integer       
#  collected_on          :datetime      
#  comments              :string(255)   
#  created_on            :datetime      
#  dt                    :string(100)   
#  first_name            :string(100)   
#  id                    :integer       not null, primary key
#  last_name             :string(100)   
#  relation              :string(50)    
#  schedule              :string(255)   
#  user_id               :integer       
#

class Caregiver < ActiveRecord::Base
  belongs_to :child
  belongs_to :user
  belongs_to :caregiver_relation
  
  has_many :addresses, :order => "created_on desc"
  has_many :phones, :order => "created_on desc"
  has_many :emails, :order => "created_on desc"
  
  validates_presence_of :child_id, :first_name, :last_name
  
  serialize :schedule
  
  attr_accessor :other_relation, :primary
  
  def address
    addresses.first
  end
  
  def after_save
    if primary == true
      child.primary_caregiver_id = id
      child.save
    end
  end
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def other_relation= (value)
    if value != ""
      write_attribute(:relation, value)
    end
  end
  
  def other_relation
     !CaregiverRelation.find_by_relation(relation) ? relation : ""
  end
  
  # Phone number functions
  def home_phone
    phones.find_by_mode('home')
  end
  
  def mobile_phone
    phones.find_by_mode('mobile')
  end
  
  def work_phone
    phones.find_by_mode('work')
  end
end
