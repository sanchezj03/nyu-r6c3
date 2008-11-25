class ParentCorpsController < ApplicationController
  before_filter :login_required
  
  def index
    render :text => "", :layout => true
  end
end
