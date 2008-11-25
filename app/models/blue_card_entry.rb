# == Schema Information
# Schema version: 51
#
# Table name: blue_card_entries
#
#  address       :string(255)   
#  child_id      :integer       
#  collected_on  :datetime      
#  created_on    :datetime      
#  dt            :string(100)   default("getdate")
#  first_name    :string(255)   
#  id            :integer       not null, primary key
#  last_name     :string(255)   
#  phone_number  :string(255)   
#  phone_number2 :string(255)   
#  phone_number3 :string(255)   
#  ptypeC        :string(8)     
#  ptypeH        :string(8)     
#  ptypeW        :string(8)     
#  relationship  :string(255)   
#

class BlueCardEntry < ActiveRecord::Base
 validates_presence_of :child_id, :first_name, :last_name
end
