# == Schema Information
# Schema version: 51
#
# Table name: staff
#
#  collected_on :datetime      
#  comments     :string(255)   
#  created_on   :datetime      
#  date_year    :integer       
#  first_name   :string(255)   
#  grade_name   :string(25)    
#  id           :integer       not null, primary key
#  last_name    :string(255)   
#  school_id    :integer       
#  teacher_id   :integer       
#  title        :string(255)   
#  user_id      :integer       
#

class Staff < ActiveRecord::Base
  set_table_name "staff"
  
  belongs_to :school
  belongs_to :user
  
  has_many :classrooms
  
  validates_presence_of :first_name, :last_name, :title
  
  def name
    last_name + ", " + first_name
  end
end
