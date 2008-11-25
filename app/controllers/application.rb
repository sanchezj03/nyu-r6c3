class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  before_filter :login_required
  before_filter :login_from_cookie # Remember me functionality
  
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_nyu_session_id'

  # Header navigation nonsense
  before_filter :set_header_navigation_variable
    
  def set_header_navigation_variable
    @header_navigation = []
	
 if current_user or current_user.admin?
		@header_navigation << { :text => "Admin", :url => { :controller => 'admin'} }
	end
end
  
  def identify_child
    @child = Child.find(params[:child_id])
  end
  
  def render_update_javascript(element, options)
	locals = {
      :element => element, 
      :segment => options[:partial] || element,
      :highlight => "#{element}#{options[:id]}",
      :message => options[:message] || "Your update has been saved!",
	  :also_update => options[:also_update] || {}, # Elements to also update with given value.
    }.merge(options[:locals] || {})
	
	render :partial => '/children/updated', :locals => locals.merge(:locals => locals)
  end
end
