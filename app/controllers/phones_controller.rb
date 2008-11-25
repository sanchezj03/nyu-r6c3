class PhonesController < ApplicationController
  before_filter :identify_child
  before_filter :identify_caregiver
  layout nil
  
  def index
    render :partial => 'caregivers'
  end
  
  def new
    @phone = Phone.new
  end
  
  def edit
    @phone = Phone.find(params[:id])
  end
  
  def update
    @phone = Phone.find(params[:id])
    
    if @phone.update_attributes(params[:phone])
      highlight_caregiver
    else
      render :action => 'edit'
    end
  end
  
  def create
    @phone = Phone.new(params[:phone])
    @phone.caregiver_id = params[:caregiver_id]
    
    if @phone.save
      highlight_caregiver
    else
      render :action => 'new'
    end
  end
  
  private
    def identify_caregiver
      @caregiver = Caregiver.find(params[:caregiver_id])
    end
    
    def highlight_caregiver
      render_update_javascript('caregivers', 
        :partial => '/caregivers/caregivers', 
        :message => "The phone number has been saved to the caregiver.",
        :id => params[:caregiver_id]
      )
    end
end
