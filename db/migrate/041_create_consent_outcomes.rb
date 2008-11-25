class CreateConsentOutcomes < ActiveRecord::Migration
  def self.up
    create_table :consent_outcomes do |t|
      t.integer :child_id
      t.boolean :consented
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :consent_outcomes
  end
end
