class CreateConsentReasons < ActiveRecord::Migration
  def self.up
    create_table :consent_reasons do |t|
      t.column :number, :integer
      t.column :reason, :string
    end
    
    reasons = {0 => "No contact",
               1 => "Consented",
               2 => "Agreed, not consented",
               3 => "Thinking about it",
               4 => "Refused",
               5 => "NE - Entered last year",
               6 => "NE - Moved away",
               888 => "NA",
               999 => "Missing"}
               
    for number, reason in reasons
      ConsentReason.create(:number => number, :reason => reason)
    end
  end

  def self.down
    drop_table :consent_reasons
  end
end
