class AddressCollectedOn < ActiveRecord::Migration
  def self.up
    add_column :addresses, :collected_on, :date
  end

  def self.down
    remove_column :addresses, :collected_on
  end
end
