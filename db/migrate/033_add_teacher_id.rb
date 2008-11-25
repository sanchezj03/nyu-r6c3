class AddTeacherId < ActiveRecord::Migration
  def self.up
    add_column :staff, :teacher_id, :integer
  end

  def self.down
    remove_column :staff, :teacher_id
  end
end

