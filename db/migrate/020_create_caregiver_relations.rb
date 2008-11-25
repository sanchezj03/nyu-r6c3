class CreateCaregiverRelations < ActiveRecord::Migration
  def self.up
    create_table :caregiver_relations do |t|
      t.column :relation, :string
    end
    
    for relation in ["Biological Mother", "Adoptive Mother","Biological Father","Adoptive Father","Foster Mother","Foster Father","Step Father","Step Mother","Current Nonmarital Partner of child's parent","Prior Nonmarital Partner of child's parent","Maternal Grandmother","Paternal Grandmother","Maternal Grandfather","Paternal Grandfather","Aunt","Uncle","Cousin","Other related to child or child's parent","Other non-related"]
      CaregiverRelation.create(:relation => relation)
    end
    
    add_column :caregivers, :caregiver_relation_id, :integer
  end

  def self.down
    drop_table :caregiver_relations
    remove_column :caregivers, :caregiver_relation_id
  end
end
