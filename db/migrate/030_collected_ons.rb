class CollectedOns < ActiveRecord::Migration
  def self.up
    # Add comments columns to database:
    add_column :addresses, :comments, :string
    add_column :caregivers, :comments, :string

    # Add collected_on fields to database
    add_column :staff, :collected_on, :date
    add_column :caregivers, :collected_on, :date
    add_column :children, :collected_on, :date
    add_column :locations, :collected_on, :date
  end

  def self.down
    remove_column :addresses, :comments
    remove_column :caregivers, :comments
    
    remove_column :staff, :collected_on
    remove_column :caregivers, :collected_on
    remove_column :children, :collected_on
    remove_column :locations, :collected_on
  end
end
