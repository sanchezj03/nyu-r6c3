class CreateInterviews < ActiveRecord::Migration
  def self.up
    create_table :interviews do |t|
	  t.integer :child_id
	  t.string :type, :status, :comments
	
      t.timestamps
    end
  end

  def self.down
    drop_table :interviews
  end
end
