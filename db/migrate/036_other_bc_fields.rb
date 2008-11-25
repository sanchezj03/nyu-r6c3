class OtherBcFields < ActiveRecord::Migration
  def self.up
    add_column :blue_card_entries, :ptypeH, :string,  :limit=>8
    add_column :blue_card_entries, :ptypeC, :string,  :limit=>8
    add_column :blue_card_entries, :ptypeW, :string,  :limit=>8
    add_column :blue_card_entries, :collected_on, :date
      
    add_column :blue_card_entries, :created_on, :timestamp
    add_column :blue_card_entries, :phone_number2, :string
    add_column :blue_card_entries, :phone_number3, :string
  end
  
  def self.down
    remove_column :blue_card_entries, :ptypeH
    remove_column :blue_card_entries, :ptypeC
    remove_column :blue_card_entries, :ptypeW
    remove_column :blue_card_entries, :collected_on

    remove_column :blue_card_entries, :created_on
    remove_column :blue_card_entries, :phone_number2
    remove_column :blue_card_entries, :phone_number3
  end
end