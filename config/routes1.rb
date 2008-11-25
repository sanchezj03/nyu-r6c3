ActionController::Routing::Routes.draw do |map|
  map.connect '', :controller => 'browse'

  map.resources :children, :collection => {:new => :any} do |child|
    child.resources :caregivers do |caregiver|
      caregiver.resources :phones
      caregiver.resources :addresses
    end
    
    child.resources :eligibilities
    child.resources :consents
    child.resources :locations
	child.resources :blue_cards
  end
  
  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
