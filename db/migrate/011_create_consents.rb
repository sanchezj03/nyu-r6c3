class CreateConsents < ActiveRecord::Migration
  def self.up
    create_table :consents do |t|
      t.column :child_id, :integer
      t.column :user_id, :integer
      
      t.column :consent_reason_id, :integer
      t.column :phase, :integer, :limit => 1
      
      t.column :withdrawn, :boolean
      t.column :created_on, :timestamp
    end
  end

  def self.down
    drop_table :consents
  end
end
