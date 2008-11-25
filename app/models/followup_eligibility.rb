# == Schema Information
# Schema version: 51
#
# Table name: followup_eligibilities
#
#  created_at :datetime      
#  id         :integer       not null, primary key
#  updated_at :datetime      
#

class FollowupEligibility < ActiveRecord::Base
  belongs_to :child
  belongs_to :user
  belongs_to :reason, :class_name => :eligilibity_reason, :foreign_key => 'reason_id'
  belongs_to :eligibility_reason, :foreign_key => 'reason_id'
  
  validates_presence_of :child_id
  validates_presence_of :reason_id, :if => :not_eligible
  validates_inclusion_of :eligible, :in => [true, false]
  
  def not_eligible
    !eligible
  end
end
