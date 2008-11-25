class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.column :caregiver_id, :integer
      t.column :user_id, :integer
      
      t.column :email, :string
      
      t.column :created_on, :timestamp
    end
  end

  def self.down
    drop_table :emails
  end
end
