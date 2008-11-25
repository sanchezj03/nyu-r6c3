class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.column :caregiver_id, :integer
      t.column :user_id, :integer

      t.column :apartment, :string, :limit => 5
      t.column :home_number, :string, :limit => 10
      t.column :street, :string
      t.column :zip_code, :integer, :limit => 5
      
      t.column :created_on, :timestamp
    end
  end

  def self.down
    drop_table :addresses
  end
end
