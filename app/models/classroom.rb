# == Schema Information
# Schema version: 51
#
# Table name: classrooms
#
#  class_id   :string(255)   
#  created_on :datetime      
#  date_year  :integer       
#  dt         :string(100)   
#  grade      :string(10)    
#  grade_name :string(25)    
#  hours      :string(7)     
#  id         :integer       not null, primary key
#  school_id  :integer       
#  teacher_id :integer       
#  user_id    :integer       
#

class Classroom < ActiveRecord::Base
  belongs_to :school
  belongs_to :staff, :class_name => 'staff', :foreign_key => 'teacher_id'
  belongs_to :user
  
  has_many :locations
  
  validates_inclusion_of :hours, :in=> %w( am pm allday )
  validates_presence_of :grade, :teacher_id, :school_id
  
  def staff
    Staff.find_by_id(teacher_id, :order => 'created_on desc')
  end
  
  def class_name
    teacher = staff
    "#{grade} (#{hours}) with #{teacher.name}"
  end
end
