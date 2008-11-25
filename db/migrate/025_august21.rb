class August21 < ActiveRecord::Migration
  def self.up
    CaregiverRelation.delete_all
    
    for relation in ["Mother", "Father", "Aunt", "Uncle"]
      CaregiverRelation.create(:relation => relation)
    end
    
    add_column :eligibilities, :collected_on, :date
    add_column :consents, :collected_on, :date
    add_column :users, :send_withdraw_email, :boolean
    
    remove_column :children, :primary_caregiver_id
  end

  def self.down
    remove_column :eligibilities, :collected_on
    remove_column :consents, :collected_on
    remove_column :users, :send_withdraw_email
    
    add_column :children, :primary_caregiver_id, :integer
  end
end
