module BrowseHelper
  def search_fields
    {
  		'Recruitment Child ID' => 'recruitment_id', 
  		'Child ID' => 'child_id', 
  		"Child's Last Name" => 'last_name', 
  		"Child's First Name" => 'first_name',
  		"Caregiver's Last Name" => 'caregiver_last_name',
  		"Caregiver's First Name" => 'caregiver_first_name'
  	}
  end
  
  def selected_field (value)
    search_fields.index(value)
  end
end