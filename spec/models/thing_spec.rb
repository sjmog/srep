require 'rails_helper'

RSpec.describe Thing, type: :model do
  it { is_expected.to validate_presence_of(:text) }

  it 'only permits valid URLs as the webhook_url' do
    expect { FactoryBot.create(:thing_with_bad_webhook_url) }.to raise_error("Validation failed: Webhook url is not a valid URL")
  end

  describe '.scheduled_for_remembering' do
    # This is where the fancy Spaced Repetition stuff lives
    before do
      SchedulerRecord.create
    end

    it 'includes Things which are scheduled to remember' do
      thing = FactoryBot.create(:thing_scheduled_for_now)

      expect(described_class.scheduled_for_remembering).to include thing
    end

    it 'does not include Things which are scheduled for the far future' do
      thing = FactoryBot.create(:thing_scheduled_for_future)

      expect(described_class.scheduled_for_remembering).not_to include thing
    end

    it 'does not include Things which are scheduled for the distant past' do
      thing = FactoryBot.create(:thing_scheduled_for_past)

      expect(described_class.scheduled_for_remembering).not_to include thing
    end
  end
end
