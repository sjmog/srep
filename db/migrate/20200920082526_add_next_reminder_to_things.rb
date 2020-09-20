class AddNextReminderToThings < ActiveRecord::Migration[6.0]
  def change
    add_column :things, :next_reminder, :datetime
  end
end
