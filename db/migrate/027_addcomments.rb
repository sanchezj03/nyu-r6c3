class Addcomments < ActiveRecord::Migration
  def self.up
    add_column :staff, :comments, :string
    add_column :schools, :comments, :string
  end

  def self.down
    remove_column :staff, :comments
    remove_column :schools, :comments
  end
end
