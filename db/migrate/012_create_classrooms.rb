class CreateClassrooms < ActiveRecord::Migration
  def self.up
    create_table :classrooms do |t|
      t.column :school_id, :integer
      t.column :teacher_id, :integer
      t.column :user_id, :integer
      
      t.column :type, :string, :limit => 7
      t.column :grade, :string, :limit => 10
      
      t.column :created_on, :timestamp
    end
  end

  def self.down
    drop_table :classrooms
  end
end
