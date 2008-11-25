class Cohort < ActiveRecord::Migration
  def self.up
    add_column :children, :cohort, :integer
    add_column :eligibilities, :cohort, :integer

    # Convert existing data to Cohort 3
    Child.update_all(:cohort => 3)
    Eligibility.update_all(:cohort => 3)
  end

  def self.down
    remove_column :children, :cohort
    remove_column :eligibilities, :cohort
  end
end
