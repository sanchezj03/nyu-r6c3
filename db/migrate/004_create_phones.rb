class CreatePhones < ActiveRecord::Migration
  def self.up
    create_table :phones do |t|
      t.column :caregiver_id, :integer
      t.column :user_id, :integer
      
      t.column :type, :string, :limit => 8
      t.column :number, :string
      
      t.column :created_on, :timestamp
    end
  end

  def self.down
    drop_table :phones
  end
end
