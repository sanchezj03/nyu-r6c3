class BlueCardsController < ApplicationController
  layout "parent_corps"
  before_filter :login_required
  
  def index
    show
    render :action => 'show'
  end
  
  def show
  #find_all_by_id_or_child_id
  #  @child = Child.find(params[:id])
    @child = Child.find(params[:id])

    @header_navigation << { :text => @child.name, :url => child_url(:id => @child) }
    @header_navigation << { :text => "#{@child.first_name}'s Blue Card", :url => child_blue_card_url(@child) }
    
    if !@child
      redirect_to :controller => 'browse', :action => 'index' and return
    end
  end
  
  def create
    return unless request.post? && params[:entry] && params[:id]
    
    @entry = BlueCardEntry.new(params[:entry])
    @entry.child_id = params[:id] 
    @entry.save
    
  #  redirect_to child_blue_cards_url(params[:id])
    redirect_to child_blue_card_url(@entry.child_id, @entry.child_id)
  end
  
  def update
    return unless request.post? && params[:id]
    
    @entry = BlueCardEntry.find(params[:id])
    @entry.update_attributes(params[:entry])
    
    flash[:notice] = "Your changes have been saved!"
    redirect_to child_blue_card_url(@entry.child_id, @entry.child_id)
  end
end
