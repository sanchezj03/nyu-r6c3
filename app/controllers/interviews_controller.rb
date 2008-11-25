class CaregiversController < ApplicationController
  before_filter :identify_child
  layout nil
  
  def index
    render :partial => 'caregivers'
  end
  
  def new
    @caregiver = Caregiver.new
  end
  
  def show
    render :partial => 'caregivers'
  end
  
  def edit
    @caregiver = Caregiver.find(params[:id])
  end
  
  def update
    @caregiver = Caregiver.find(params[:id])
    
    if @caregiver.update_attributes(params[:caregiver])
      render_update_javascript('caregivers', :id => @caregiver.id, :message => "The caregiver has been updated!")
    else
      render :action => 'edit'
    end
  end
  
  def create
    @caregiver = Caregiver.new(params[:caregiver])
    @caregiver.child_id = @child.id
    
    if @caregiver.save
      render_update_javascript('caregivers', :message => "The caregiver has been added to this child!")
    else
      render :action => 'new'
    end
  end
end