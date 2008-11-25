class AddWithdrawalColumnToConsentOutcomes < ActiveRecord::Migration
  def self.up
   add_column :consent_outcomes, :withdrawn, :integer
  end

  def self.down
   add_column :consent_outcomes, :withdrawn
  end
end
