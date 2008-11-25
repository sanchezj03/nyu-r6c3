class ChildSchoolId < ActiveRecord::Migration
def self.up
	add_column :children, :childschoolId2, :integer
  end

  def self.down
	remove_column :children, :childschoolId2 
  end
end
