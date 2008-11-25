# == Schema Information
# Schema version: 39
#
# Table name: consents
#
#  id                   :integer(11)   not null, primary key
#  child_id             :integer(11)   
#  user_id              :integer(11)   
#  consent_reason_id    :integer(11)   
#  phase                :integer(1)    
#  withdrawn            :boolean(1)    
#  created_on           :datetime      
#  comments             :string(255)   
#  consented            :boolean(1)    
#  collected_on         :date          
#  caregiver_id         :integer(11)   
#  is_primary_caregiver :boolean(1)    
#

class Consent < ActiveRecord::Base
  belongs_to :child
  belongs_to :consent_reason
  belongs_to :caregiver
  
  validates_presence_of :child_id, :phase, :caregiver_id
  validates_inclusion_of :consented, :in => [true, false], :if => Proc.new { |consent| !consent.withdrawn }
  validates_inclusion_of :phase, :within => 1..3
  validates_presence_of :consent_reason_id, :if => Proc.new { |consent| !consent.withdrawn and !consent.consented? }
  
  after_create :generate_child_id, :notify_by_email

  def withdrawn?
	withdrawn == 1
  end
  
  def consented?
    self.consented == true
  end
  
  def consented
    # For MS SQL only
    read_attribute(:consented) == 1 ? true : false 
  end

  def reason
    self.consent_reason_id = 1 if consented?
    ConsentReason.find(consent_reason_id).reason
  end

  
  
  private
    def generate_child_id
      child.create_child_id() if consented?
    end
    
    def notify_by_email
      Notifier.deliver_withdrawal(child) if withdrawn?
    end
end
