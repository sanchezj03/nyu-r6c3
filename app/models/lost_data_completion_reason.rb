# == Schema Information
# Schema version: 51
#
# Table name: lost_data_completion_reasons
#
#  id     :integer       not null, primary key
#  reason :string(75)    
#

class LostDataCompletionReason < ActiveRecord::Base
end
