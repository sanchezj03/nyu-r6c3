class Bcmod < ActiveRecord::Migration
  def self.up
    add_column :blue_card_entries, :relationship, :string
  end

  def self.down
    remove_column :blue_card_entries, :relationship
  end
end
