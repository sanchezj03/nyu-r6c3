class AdminController < ApplicationController
  before_filter :login_required
  layout "parent_corps"
  
  def index
  end
  
  # Show the school specified by the parameter "id"
  def school
    @school = School.find(params[:id])

	year = params[:date][:year]
	grade = params[:grade_name]
	
	default_params = {
		:date_year => year,
		:grade_name => grade,
		:school_id => @school.id
	}
	
	@classroom = Classroom.new(default_params)
	@staff = Staff.new(default_params)
	
	@classrooms = @school.classrooms.find_all_by_date_year_and_grade_name(year, grade)
	@staff_members = @school.teachers.find_all_by_date_year_and_grade_name(year, grade)
  end
  
  # Update a user account
  def update_user
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    @user.save
    
    redirect_to :action => :users
  end
  
  # Create a user account
  def create_user
    @user = User.new(params[:user])
    @user.save
    
    redirect_to :action => :users
  end
  
  # Delete a user account
  def delete_user
    User.delete(params[:id])
    render :text => ""
  end
end
