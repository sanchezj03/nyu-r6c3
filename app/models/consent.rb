# == Schema Information
# Schema version: 51
#
# Table name: consents
#
#  caregiver_id         :integer       
#  child_id             :integer       
#  collected_on         :datetime      
#  comments             :string(255)   
#  consent_reason_id    :integer       
#  consented            :integer       
#  created_on           :datetime      
#  dt                   :string(100)   default("getdate")
#  id                   :integer       not null, primary key
#  is_primary_caregiver :integer       
#  phase                :integer       
#  user_id              :integer       
#  withdrawn            :integer       
#

class Consent < ActiveRecord::Base
  belongs_to :child
  belongs_to :consent_reason
  belongs_to :caregiver
  
  validates_presence_of :child_id, :phase
  validates_inclusion_of :consented, :in => [true, false, '1', '0'], :if => Proc.new { |consent| !consent.withdrawn }
  validates_inclusion_of :phase, :within => 1..3
  
  validates_presence_of :consent_reason_id, :if => Proc.new { |consent| !consent.withdrawn and !consent.consented? }
  validates_presence_of :consented, :if => Proc.new { |consent| !consent.withdrawn? }
  validates_presence_of :caregiver_id, :if => Proc.new { |consent| consent.consented? }
  
  
  after_create :generate_child_id, :notify_by_email

  def withdrawn= (value)
    write_attribute(:withdrawn, value == "1")
  end
  
  def withdrawn?
    read_attribute(:withdrawn).to_s == '1'
  end
  
  def consented?
    [1, true].include? consented
  end
  
  def consented= (boolean)
    self.consent_reason_id = 1 if boolean
    write_attribute(:consented, boolean)
  end
  
  #def consented
    # For MS SQL only
  #  read_attribute(:consented) == 1 ? true : false
  #end
  
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
