class ChildrenController < ApplicationController
  layout "parent_corps", :except => [:edit, :update]
  before_filter :set_header_navigation
  before_filter :identify_child, :except => [:new, :create]
  
  def new
    @child = Child.new(params[:child])
    
    if request.post? and @child.save
      redirect_to child_url(:id => @child)
    end
  end
  
  def show
    @header_navigation << { :text => @child.name, :url => child_url(:id => @child) }
	render :partial => 'child' if request.xhr?
  end
  
  def show_snippet
    render :partial => 'child'
  end
  
  def update
    attributes = params[:child]
    attributes[:race] = (attributes[:race] || []) + (params[:race] || [])
    
    if @child.update_attributes(attributes)
	  render_update_javascript('child', :locals => {
        :partial => "child", 
        :message => "The child information has been updated!"})
    else
      render :action => 'edit'
    end
  end
  
  private
    def set_header_navigation
      @header_navigation << { :text => "Search for Child", :url => { :controller => 'browse', :action => 'index' }, :other_actions => [:search] }
      @header_navigation << { :text => "Add Child", :url => { :controller => 'children', :action => 'new' } }
    end
    
    def identify_child
      @child = Child.find(params[:id])
    end
end
