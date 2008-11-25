class MissingConsentOutcomeFields < ActiveRecord::Migration
  def self.up
    add_column :consent_outcomes, :collected_on, :date
    add_column :consent_outcomes, :comments, :text
  end

  def self.down
    remove_column :consent_outcomes, :collected_on
    remove_column :consent_outcomes, :comments
  end
end
