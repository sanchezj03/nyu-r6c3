class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.column :child_id, :integer
      t.column :user_id, :integer
      
      t.column :status, :string
      
      t.column :created_on, :timestamp
    end
  end

  def self.down
    drop_table :locations
  end
end
