class UpdateSept3rd < ActiveRecord::Migration
  def self.up
    # Caregiver to consent
    add_column :consents, :caregiver_id, :integer
    
    # First/last name of staff
    add_column :staff, :first_name, :string
    add_column :staff, :last_name, :string
    remove_column :staff, :name
    
    # Class id
    add_column :classrooms, :class_id, :string
  end

  def self.down
    remove_column :consents, :caregiver_id
    
    remove_column :staff, :first_name
    remove_column :staff, :last_name
    add_column :staff, :name, :string
    
    remove_column :classrooms, :class_id
  end
end
