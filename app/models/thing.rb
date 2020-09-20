class Thing < ApplicationRecord
  has_many :webhook_responses
  
  validates :text, presence: true
  validates :webhook_url, url: true

  def self.scheduled_for_remembering
    last_reminder = SchedulerRecord.last ? SchedulerRecord.last.created_at : DateTime.new

    where("next_reminder > ? AND next_reminder < ?",
          last_reminder, DateTime.now)
  end
end
