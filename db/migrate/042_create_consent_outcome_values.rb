class CreateConsentOutcomeValues < ActiveRecord::Migration
  def self.up
    create_table :consent_outcome_values do |t|
      t.string :outcome
      t.timestamps
    end
    
    inwhere = "in G1 and G2 only"
    ["classroom observations", "teacher report", "school based testing", "height and weight", "parent interview"].each {
      |outcome| ConsentOutcomeValue.create(:outcome => "#{outcome} #{inwhere}")
    }
    
    ConsentOutcomeValue.create(:outcome => "Consented")
  end

  def self.down
    drop_table :consent_outcome_values
  end
end
