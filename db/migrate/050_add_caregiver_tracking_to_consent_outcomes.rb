class AddCaregiverTrackingToConsentOutcomes < ActiveRecord::Migration
  def self.up
	add_column :consent_outcomes, :caregiver_id, :integer
  end

  def self.down
	remove_column :consent_outcomes, :caregiver_id
  end
end
