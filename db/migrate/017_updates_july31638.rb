class UpdatesJuly31638 < ActiveRecord::Migration
  def self.up
    rename_column :classrooms, :type, :hours
  end

  def self.down
    rename_column :classrooms, :hours, :type
  end
end
