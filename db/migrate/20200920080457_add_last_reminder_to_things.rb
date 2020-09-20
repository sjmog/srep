class AddLastReminderToThings < ActiveRecord::Migration[6.0]
  def change
    add_column :things, :last_reminder, :datetime, null: true
  end
end
