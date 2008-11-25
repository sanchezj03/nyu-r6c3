class JesusIds < ActiveRecord::Migration
  def self.up
    add_column :children,      :child_id,      :string, :limit => 7
    add_column :caregivers,  :caregiver_id,  :string, :limit => 11
    
    add_column :consent_reasons, :yes, :boolean, :default => false
    ConsentReason.find_by_reason("Consented").update_attributes(:yes => true)
  end

  def self.down
    remove_column :children,     :child_id
    remove_column :caregivers, :caregiver_id
    
    remove_column :consent_reasons, :yes
  end
end
