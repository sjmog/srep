class CreateSchedulerRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduler_records do |t|

      t.timestamps
    end
  end
end
