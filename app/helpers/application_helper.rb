# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def navigation_tab(link)
    url = link[:url]
    is_current = false
    other_actions = link[:other_actions] || {}
    options = link[:options] || {}
    
    # Is it the current one?
    if current_page?(url)
      is_current = true
      options[:class] = "" unless options[:class]
      options[:class] += " current"
    end
    
    content_tag(:li, link_to(link[:text], url), options)
  end
	
  def header_navigation
		if @current_user.admin?
		  @header_navigation << {:text => "Administration", :url => {:controller => 'admin'}}
		end
		
		if params[:controller] != "browse"
		  @header_navigation << {:text => "Search for child", :url => {:controller => 'browse'}, :options => {:class => "rightside"}}
		end
		
    @header_navigation << {:text => "Logout", :url => {:controller => 'account', :action => 'logout'}, :options => {:class => "rightside"}}
    return @header_navigation
	end
	
	def remote_link(url, element, options = {})
	  options[:text] ||= "Edit"
	  options[:text] = "Close without saving" if options[:lose_focus]
	  
    return link_to_remote(options[:text], {
      :url => url, 
      :update => element,
      :success => "#{"lose_" if options[:lose_focus]}focus_on_element('#{element}')",
      :method => options[:method] || :get },
    {
      :class => options[:class] || "edit_link"
    })
  end
  
  def remote_update_form_for(object, options, &block)
    element = options[:element]
    remote_form_for object, :url => options[:url], :update => element, &block
  end
end
