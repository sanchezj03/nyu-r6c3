class CreateEligibilityReasons < ActiveRecord::Migration
  def self.up
    create_table :eligibility_reasons do |t|
      t.column :number, :integer
      t.column :reason, :string
    end
    
    reasons = {1 => "Yes",
               2 => "No, language",
               3 => "No, sibling",
               4 => "Moved/moving",
               5 => "Participated last year",
               6 => "Age"}
               
    for number, reason in reasons
      EligibilityReason.create(:number => number, :reason => reason)
    end
  end

  def self.down
    drop_table :eligibility_reasons
  end
end
