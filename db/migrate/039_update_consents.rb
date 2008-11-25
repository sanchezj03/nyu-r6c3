class UpdateConsents < ActiveRecord::Migration
  def self.up
    rename_column :consents, :respondent, :is_primary_caregiver
  end

  def self.down
    rename_column :consents, :is_primary_caregiver, :respondent
  end
end
