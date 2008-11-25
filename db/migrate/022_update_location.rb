class UpdateLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :classroom_id, :integer
    add_column :locations, :comments, :string
  end

  def self.down
    remove_column :locations, :classroom_id
    remove_column :locations, :comments
  end
end
