class ConsentsController < ApplicationController
  before_filter :identify_child
  layout nil
  
  def index
    render :partial => 'consent'
  end
  
  def new
    @consent = Consent.new
  end
  
  def show
    render :partial => 'eligibility'
  end
  
  def edit
    @consent = Consent.find(params[:id])
  end
  
  def update
    @consent = Consent.find(params[:id])
    
    if @consent.update_attributes(params[:consent])
      render_update_javascript('consent', :message => "This consent entry has been updated.")
    else
      render :action => 'edit'
    end
  end
  
  def create
    @consent = Consent.new(params[:consent])
    @consent.child_id = @child.id
    
    if @consent.save
		@child.reload
		render_update_javascript('consent', :message => "A consent entry for this child has been saved!", :also_update => { :child_id => @child.child_id })
	else
      render :action => 'new'
    end
  end
end
