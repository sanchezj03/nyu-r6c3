# == Schema Information
# Schema version: 51
#
# Table name: schools
#
#  comments :string(255)   
#  id       :integer       not null, primary key
#  location :string(255)   
#  number   :string(100)   
#

class School < ActiveRecord::Base
  has_many :classrooms
  has_many :PreK_classrooms, :class_name => 'Classroom', :conditions => ["grade_name=?", 'PreK']
  has_many :K_classrooms, :class_name => 'Classroom', :conditions => ["grade_name=?", 'Kindergarten']
  has_many :Grade1_classrooms, :class_name => 'Classroom', :conditions => ["grade_name=?", '1st Grade']
  has_many :Grade2_classrooms, :class_name => 'Classroom', :conditions => ["grade_name=?", '2nd Grade']
  
  has_many :teachers, :class_name => 'Staff'
  
  validates_numericality_of :number
  
  def name
   "P.S. #{number}"
 end
  
end
