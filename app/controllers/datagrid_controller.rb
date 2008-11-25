class DatagridController < ApplicationController

	def index
		
		sessionlist = Sessionlist.find(:first, :conditions => ["session_id = ?", session.session_id])
		
		if !sessionlist
		
			Sessionlist.create ( [ { :session_id => session.session_id} ] )
		
			Familymember.create(
				[ { :name => "Emma",
					:relation => "Mother",
					:birthday => "01/10/1951",
					:deceased => false,
					:session_id => session.session_id
				  },
				  { :name => "Michael",
				  	:relation => "Father",
					:birthday => "10/03/1948",
					:deceased => false,
					:session_id => session.session_id
				  },
				  { :name => "Margaret",
				  	:relation => "Grandmother",
					:birthday => "07/01/1926",
					:deceased => true,
					:session_id => session.session_id
				  } ] )
		end

		@familymember = Familymember.find(:all, :conditions => ["session_id = ?", session.session_id])
	end

    def familymembers_render(id)
        familymembers = Familymember.find(:all, :conditions => ["session_id = ?", id])
        render(:partial => "familymembers", :collection => familymembers, :layout => false)
    end
    
    def familymembers_add
   		if request.post?
            Familymember.create(:session_id => session.session_id, :birthday => Time.now)
            familymembers_render(session.session_id)
        else
            render(:nothing => true)
        end
    end
    
    def familymembers_delete
        if request.post?
            Familymember.destroy(params[:id])
            familymembers_render(session.session_id)
        else
            render(:nothing => true)
        end
    end
    
    def update_name
        if request.post?
            if !params[:data].nil?
                Familymember.update(params[:id], :name => params[:data])
            end
        end
        render(:nothing => true)
    end

    def update_relation
        if request.post?
            if !params[:data].nil?
                Familymember.update(params[:id], :relation => params[:data])
            end
        end
        render(:nothing => true)
    end
    
    def update_birthday
        if request.post?
            Familymember.update(params[:id], :birthday_sd => params[:month] + "/" + params[:day] + "/" + params[:year])
        end
        render(:nothing => true)
    end
    
    def update_deceased
        if request.post?
            Familymember.update(params[:id], :deceased => params[:data])
        end
        render(:nothing => true)
    end
    
    def familymembers
        render(:layout => false)
    end

end
