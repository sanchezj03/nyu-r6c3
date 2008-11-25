class EditController < ApplicationController
  layout "parent_corps"
  before_filter :login_required
  before_filter :find_child
  
  def child
  end

  def update_child
    child_info = params[:child]
    @child.update_attributes(child_info)
    @child.race = (params[:race] - [""])
    @child.save
    redirect_to :controller => 'browse', :action => 'child', :id => @child.id
  end

  def address
  end
   
  def eligibility
   @eligible= @child.eligibilities.find_by_id(params[:eligibility_id])  
  end

  def update_eligibility
   eligible_info = params[:eligible]
   @eligible= @child.eligibilities.find_by_id(params[:eligibility_id])
   @eligible.update_attributes(eligible_info)
   redirect_to :controller => 'browse', :action => 'child', :id => @child.id
 end

  def location
   @location= @child.locations.find_by_id(params[:location_id])  
  end

  def update_location
   location_info = params[:location]
   @location= @child.locations.find_by_id(params[:location_id])
   @location.update_attributes(location_info)
   redirect_to :controller => 'browse', :action => 'child', :id => @child.id
  end

  def consent
   @consent= @child.consents.find_by_id(params[:consent_id])  
  end

  def update_consent
   consent_info = params[:consent]
   @consent= @child.consents.find_by_id(params[:consent_id])
   @consent.update_attributes(consent_info)
   redirect_to :controller => 'browse', :action => 'child', :id => @child.id
  end

  def caregiver
    @caregiver = @child.caregivers.find_by_id(params[:caregiver_id])
  end
  
  def update_caregiver
    info = params[:caregiver]
    @caregiver = @child.caregivers.find_by_id(params[:caregiver_id])
    @caregiver.update_attributes(info)
  
    redirect_to :controller => 'browse', :action => 'child', :id => @child.id
  end
  
  def address
    @address = Address.find(params[:address_id])
  end

  def update_address
    @address = Address.find(params[:address_id])
    @address.update_attributes(params[:address])
 
    redirect_to :controller => 'browse', :action => 'child', :id => @child.id
  end

  def phone
    @phone = Phone.find(params[:phone_id])
  end

  def update_phone
    @phone = Phone.find(params[:phone_id])
    @phone.update_attributes(params[:phone])
 
    redirect_to :controller => 'browse', :action => 'child', :id => @child.id
  end
  
  private
  def find_child
    id = params[:id]
    @child = Child.find_by_rchild_id(id)
  end
end
