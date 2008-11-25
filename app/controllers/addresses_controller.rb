class AddressesController < ApplicationController
  before_filter :identify_child
  before_filter :identify_caregiver
  layout nil
  
  def index
    render :partial => 'caregivers'
  end
  
  def new
    @address = Address.new
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    
    if @address.update_attributes(params[:address])
      highlight_caregiver
    else
      render :action => 'edit'
    end
  end
  
  def create
    @address = Address.new(params[:address])
    @address.caregiver_id = params[:caregiver_id]
    
    if @address.save
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
        :message => "The address has been saved to the caregiver.",
        :id => params[:caregiver_id]
      )
    end
end
