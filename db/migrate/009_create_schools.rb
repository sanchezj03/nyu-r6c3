class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.column :number, :integer, :limit => 3
      t.column :location, :string
    end
    
    for number in [66, 114, 115, 135, 167, 181, 208, 219, 244, 394]
      School.create(:number => number)
    end
  end

  def self.down
    drop_table :schools
  end
end
