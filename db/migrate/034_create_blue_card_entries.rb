class CreateBlueCardEntries < ActiveRecord::Migration
  def self.up
    create_table :blue_card_entries do |t|
      t.column :child_id, :integer
      
      t.column :first_name, :string
      t.column :last_name, :string
      
      t.column :phone_number, :string
      t.column :address, :string
    end
  end

  def self.down
    drop_table :blue_card_entries
  end
end
