module LocationsHelper
	def type_name_without_location
		type = params[:type] ? params[:type] : @location.type
		type[ 0, type.length - "Location".length ] if type
	end
end
