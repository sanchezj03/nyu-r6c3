class ChangeTeacherToStaff < ActiveRecord::Migration
  def self.up
    rename_table :teachers, :staff
    add_column :staff, :title, :string
    
    create_table :staff_titles do |t|
      t.column :title, :string
    end
    
    Staff.update_all "title = 'Teacher'"
    StaffTitle.create(:title => "Teacher")
    StaffTitle.create(:title => "Nurse")
  end

  def self.down
    drop_table :staff_titles
    rename_table :staff, :teachers
  end
end
