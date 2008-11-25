class CreateEligibilities < ActiveRecord::Migration
  def self.up
    create_table :eligibilities do |t|
      t.column :child_id, :integer
      t.column :user_id, :integer
      t.column :reason_id, :integer
      
      t.column :eligible, :boolean
      t.column :comments, :string
      
      t.column :created_on, :timestamp
    end
  end

  def self.down
    drop_table :eligibilities
  end
end
