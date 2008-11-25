class BrowseController < ApplicationController
  layout "parent_corps"
  before_filter :set_header_navigation
  
  def index
    field = params[:field]
    value = params[:query]
    
    if field and value
		# Join caregiver if it's one of the fields we're searching by
		if field =~ /caregiver/
			@children = Child.find(:all, 
				:include => [:caregivers], 
				:conditions => { "caregivers.#{field[10, 20]}" => value })
		else
			@children = Child.find(:all, :conditions => { field => value })
		end
		
		flash[:notice] = @children.size == 0 ? "Sorry, no children matched your search parameters." : nil
    else
      @children = []
    end
    
    render :action => 'index'
  end
  
  def child
    @child = Child.find(params[:id])
  end
  
  private
    def set_header_navigation
      @header_navigation << { :text => "Search for Child", :url => { :controller => 'browse', :action => 'index' }, :other_actions => [:search] }
      @header_navigation << { :text => "Add Child", :url => { :controller => 'children', :action => 'new' } }
    end
end
