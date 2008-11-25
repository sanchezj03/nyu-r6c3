class ChildrenUpdate < ActiveRecord::Migration
  def self.up
    # Make false the default for boolean attributes
    change_column_default :children, :yoked_pair, false
    change_column_default :children, :child_link, false
    
    # Make the columns only as long as they need to be
    change_column :children, :child_id, :integer, :limit => 5
    change_column :children, :rchild_id, :integer, :limit => 6
    
    # Rename some columns so they makes more sense
    rename_column :children, :child_link, :child_is_linked
    rename_column :children, :rchild_id, :recruitment_id
    rename_column :children, :child_link_specify, :linked_child
    
    # Primary secondary -> is_primary makes more sense
    # But we have to move the data over too by creating a new column, then deleting the old one
    add_column :children, :is_primary, :boolean
    
	Child.reset_column_information
    Child.find(:all).each do |child|
		if child.primary_secondary
			child.update_attribute(:is_primary, child.primary_secondary.downcase == "p")
		end
	end
    remove_column :children, :primary_secondary
  end

  def self.down
    # Change the names back to what it was
    rename_column :children, :child_is_linked, :child_link
    rename_column :children, :recruitment_id, :rchild_id
    rename_column :children, :linked_child, :child_link_specify    

    # Change some column values back to what they were
    change_column :children, :child_id, :string, :limit => 7
    change_column :children, :rchild_id, :integer, :limit => 7
    
    # Move the data back and move it back
    add_column :children, :primary_secondary, :string, :limit => 1
	
    Child.reset_column_information
    Child.find(:all).each do |child|
		if child.is_primary
			child.update_attribute(:primary_secondary, (child.is_primary == true) ? "P" : "S")
		end
	end
    remove_column :children, :is_primary
  end
end
