class SpecifySecondaryYoked < ActiveRecord::Migration
  def self.up
	add_column :children, :secondary_yoked_child, :string
  end

  def self.down
	remove_column :children, :secondary_yoked_child
  end
end
