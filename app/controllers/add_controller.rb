class AddController < ApplicationController
  # This will use the app/views/layouts/parent_corps layout
  layout "parent_corps"
  
  before_filter :login_required
  
  # Save new address
  def address
    return unless request.post?
    address = Address.new(params[:new_address])
    address.caregiver_id = params[:id]
    address.save
    address.reload
    
    return_to_child(address.caregiver.child.id)
  end
  
  # New caregiver page
  def caregiver
    @child = Child.find(params[:id])
    save_caregiver()
    return_to_child(@child.id)
  end
  
  # Save new caregiver
  def save_caregiver
    @caregiver = Caregiver.new(params[:caregiver])
    @caregiver.child_id = @child.id
    @caregiver.save
    
    for mode, number in params[:phone]
      save_phone(number, mode, @caregiver)
    end
    
    @address = Address.new(params[:address])
    @address.caregiver_id = @caregiver.id
    @address.save
  end
  
  # New child page
  def child
    @child = Child.new
    @phone = Phone.new
  end
  
  # Save new child
  def save_child
    @child = Child.new(params[:child])
    @child.race = (params[:race] - [""])
    @child.save
    
    return_to_child(@child.id)
  end
  
  # Save classroom
  def classroom
    room = Classroom.new(params[:classroom])
    room.school_id = params[:id]
    room.save
    
    redirect_to :controller => 'admin', :action => 'school', :id => params[:id], :date => { :year => room.date_year }, :grade_name => room.grade_name
  end
  
  # Save eligibility
  def eligibility
    @eligible = Eligibility.new(params[:eligible])
    @eligible.child_id = params[:id]
    @eligible.save
    
    return_to_child(params[:id])
  end
  
  # Save consent
  def consent
    @consent = Consent.new(params[:consent])
    @consent.child_id = params[:id]
    @consent.save
    
    return_to_child(params[:id])
  end
  
  # Save location
  def location
    @location = Location.new(params[:location])
    @location.child_id = params[:id]
    @location.save
    
    return_to_child(params[:id])
  end
  
  # Save phone number
  def phone
    phone = Phone.new(params[:phone])
    phone.caregiver_id = params[:id]
    phone.save
    
    return_to_child(Caregiver.find(params[:id]).child.id)
  end
  
  # Save staff
  def staff
    staff = Staff.new(params[:staff])
    staff.school_id = params[:id]
    staff.save
    
    redirect_to :controller => 'admin', :action => 'school', :id => params[:id], :date => { :year => staff.date_year }, :grade_name => staff.grade_name
  end
  
  private
  # Save phone number (used when adding multiple phone #s)
  def save_phone (number, mode, caregiver)
    if number != ""
      phone = Phone.new(
        :mode => mode,
        :number => number, 
        :caregiver_id => caregiver.id)
      phone.save
      return phone
    end
  end
  
  def return_to_child(child_id)
    redirect_to :controller => 'browse', :action => 'child', :id => child_id
  end
  
  private
    def set_header_navigation
    end
end
