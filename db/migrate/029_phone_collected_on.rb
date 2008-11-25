class PhoneCollectedOn < ActiveRecord::Migration
  def self.up
    add_column :phones, :collected_on, :date
  end

  def self.down
    remove_column :phones, :collected_on
  end
end
