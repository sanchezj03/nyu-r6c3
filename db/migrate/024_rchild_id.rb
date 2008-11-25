class RchildId < ActiveRecord::Migration
  def self.up
    add_column :children, :rchild_id, :integer, :limit => 7
  end

  def self.down
    remove_column :children, :rchild_id
  end
end
