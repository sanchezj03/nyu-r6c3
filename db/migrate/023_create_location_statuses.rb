class CreateLocationStatuses < ActiveRecord::Migration
  def self.up
    create_table :location_statuses do |t|
      t.column :text, :string
      t.column :in_target_school, :boolean, :defailt => false
    end
    
    LocationStatus.create(:text => "In one of the 10 target schools", :in_target_school => true)
    LocationStatus.create(:text => "In NYC, but not in the 10 schools")
    LocationStatus.create(:text => "Out of state")
    LocationStatus.create(:text => "Out of the country")
    
    rename_column :locations, :status, :status_id
  end

  def self.down
    drop_table :location_statuses
  end
end
