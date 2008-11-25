class CreateCaregivers < ActiveRecord::Migration
  def self.up
    create_table :caregivers do |t|
      t.column :child_id, :integer
      t.column :user_id, :integer
      
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :relation, :string
      t.column :schedule, :string

      t.column :created_on, :timestamp
    end
  end

  def self.down
    drop_table :caregivers
  end
end
