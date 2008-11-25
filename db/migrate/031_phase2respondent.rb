class Phase2respondent < ActiveRecord::Migration
  def self.up
   # Add comments columns to database:
    add_column :consents, :respondent, :boolean

  end

  def self.down
   remove_column :consents, :respondent 
  end
end
