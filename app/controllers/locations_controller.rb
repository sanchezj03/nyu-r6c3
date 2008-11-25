class LocationsController < ApplicationController
  before_filter :identify_child
  layout nil
  
  def index
    if params[:type]
		location = params[:type].classify.constantize
		render :partial => '/locations/location', :locals => { 
			:name => location.type_name, 
			:type => location.new.type_only
		}
	else
		render :partial => 'location'
	end
  end
  
  def new
	@location = params[:type].classify.constantize.new
  end
  
  def show
    render :partial => 'location'
  end
  
  def edit
    @location = Location.find(params[:id])
  end
  
  def update
    @location = Location.find(params[:id])
    
    if @location.update_attributes(params[:location])
		render_update(@location, "This consent entry has been updated.")
    else
		render :action => 'edit'
    end
  end
  
  def create
    @location = params[:location][:type].constantize.new(params[:location])
    @location.child_id = @child.id
    
    if @location.save
		render_update(@location, "The new location for the child has been entered.")
	else
      render :action => 'new'
    end
  end
  
	private
	def render_update(location, message)
		render_update_javascript("location_#{location.type_only}", :partial => "location", :locals => { :type => @location.type_only, :name => @location.type_only }, :message => message)
	end
end
