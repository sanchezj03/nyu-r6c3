class EligibilitiesController < ApplicationController
  before_filter :identify_child
  layout nil
  
  def index
    render :partial => 'eligibility', :locals => params
  end
  
  def new
    @eligibility = params[:model].constantize.new
  end
  
  def show
    render :partial => 'eligibility', :locals => params
  end
  
  def edit
    @eligibility = Eligibility.find(params[:id])
  end
  
  def update
    @eligibility = Eligibility.find(params[:id])
    
    if @eligibility.update_attributes(params[:eligibility])
      render_update_javascript(@eligibility.class.to_s, :partial => 'eligibility', :locals => { :model => @eligibility.class.to_s },  :message => "This eligibility entry has been updated.")
    else
      render :action => 'edit'
    end
  end
  
  def create
    @eligibility = params[:eligibility][:type].constantize.new(params[:eligibility])
    @eligibility.child_id = @child.id
    
    if @eligibility.save
      render_update_javascript(@eligibility.class.to_s, 
		:partial => 'eligibility', 
		:locals => { :model => @eligibility.class.to_s }, 
		:message => "The eligibility of this child has been updated!")
    else
      render :action => 'new'
    end
  end
end
