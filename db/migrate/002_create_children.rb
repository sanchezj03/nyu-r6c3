class CreateChildren < ActiveRecord::Migration
  def self.up
    create_table :children do |t|
      t.column :user_id, :integer
      
      t.column :last_name, :string
      t.column :first_name, :string
      t.column :birthday, :date
      t.column :gender, :string, :limit => 1
      t.column :hispanic, :boolean
      t.column :race, :string
      t.column :yoked_pair, :boolean
      t.column :primary_secondary, :string, :limit => 1
      
      t.column :created_on, :timestamp
    end
  end

  def self.down
    drop_table :children
  end
end
