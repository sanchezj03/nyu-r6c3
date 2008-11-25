class ConsentAndOtherStuff < ActiveRecord::Migration
  def self.up
    add_column :consents, :consented, :boolean

    EligibilityReason.find_by_reason('Yes').destroy
    ConsentReason.find_by_reason('Consented').destroy
  end

  def self.down
    remove_column :consents, :consented
  end
end
