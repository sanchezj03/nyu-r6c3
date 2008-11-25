class ChildLink < ActiveRecord::Migration
def self.up
 add_column :children, :child_link, :boolean
 add_column :children, :child_link_specify, :string
end

def self.down
 remove_column :children, :child_link
 remove_column :children, :child_link_specify 
end
end

 