class CreateTeachers < ActiveRecord::Migration
  def self.up
    create_table :teachers do |t|
      t.column :school_id, :integer
      t.column :user_id, :integer
      
      t.column :name, :string
      
      t.column :created_on, :timestamp
    end
  end

  def self.down
    drop_table :teachers
  end
end
