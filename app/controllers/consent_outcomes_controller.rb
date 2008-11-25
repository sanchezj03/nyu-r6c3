class ConsentOutcomesController < ApplicationController
  before_filter :identify_child
  layout nil

  def index
    render :partial => 'consent_outcome'
  end

  def new
    @consent = ConsentOutcome.new
  end

  def show
    render :partial => 'consent_outcome'
  end

  def edit
    @consent = ConsentOutcome.find(params[:id])
  end

  def update
    @consent = ConsentOutcome.find(params[:id])

    if @consent.update_attributes(params[:consent])
      render_update_javascript('consent_outcome', :message => "This consent outcome entry has been updated.")
    else
      render :action => 'edit'
    end
  end

  def create
    @consent = ConsentOutcome.new(params[:consent])
    @consent.child_id = @child.id

    if @consent.save
      render_update_javascript('consent_outcome', :message => "A consent outcome for this child has been saved!")
    else
      render :action => 'new'
    end
  end
end
