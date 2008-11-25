# == Schema Information
# Schema version: 51
#
# Table name: familymembers
#
#  birthday   :datetime      
#  deceased   :integer       not null
#  id         :integer       not null, primary key
#  name       :string(255)   
#  relation   :string(255)   
#  session_id :string(64)    not null
#

class Familymember < ActiveRecord::Base

    def birthday_sd
        if read_attribute('birthday').nil?
            ""
        else
            read_attribute('birthday').strftime("%m/%d/%Y")
        end
    end
    
    def birthday_sd=(d)
        write_attribute('birthday', d)
    end
	
end
