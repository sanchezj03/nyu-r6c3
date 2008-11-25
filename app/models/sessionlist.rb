# == Schema Information
# Schema version: 51
#
# Table name: sessionlists
#
#  id         :integer       not null, primary key
#  session_id :string(64)    not null
#

class Sessionlist < ActiveRecord::Base
end
