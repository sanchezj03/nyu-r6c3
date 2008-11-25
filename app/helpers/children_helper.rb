module ChildrenHelper
	def fieldset_box(name, options, locals = {})
		content_tag("div", :class => 'fieldset', :id => name.to_s + "_content") do
			content_tag("div", :id => name, :class => 'inner') do
				render :partial => options[:partial], :locals => locals
			end
		end
	end
end
