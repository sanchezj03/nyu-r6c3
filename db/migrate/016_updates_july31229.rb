class UpdatesJuly31229 < ActiveRecord::Migration
  def self.up
    # Primary caregiver
    add_column :children, :primary_caregiver_id, :integer
    
    # Expand the address table
    add_column :addresses, :city, :string
    add_column :addresses, :state, :string
    add_column :addresses, :country, :string
    
    # Add comments to a bunch of tables
    add_column :children, :comments, :string
    add_column :consents, :comments, :string
    add_column :phones, :comments, :string
    
    # Phone type column is messed up. Let's rename it
    rename_column :phones, :type, :mode
  end

  def self.down
    remove_column :children, :primary_caregiver_id
    
    remove_column :addresses, :city
    remove_column :addresses, :state
    remove_column :addresses, :country
    
    remove_column :children, :comments
    remove_column :consents, :comments
    remove_column :phones, :comments
    
    rename_column :phones, :mode, :type
  end
end
