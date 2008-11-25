class CreateLostDataCompletionReasons < ActiveRecord::Migration
  def self.up
    create_table :lost_data_completion_reasons2 do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :lost_data_completion_reasons2
  end
end
