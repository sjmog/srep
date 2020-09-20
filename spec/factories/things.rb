FactoryBot.define do
  factory :thing do
    text { "Hello, World!" }
    webhook_url { "https://example.com" }
    next_reminder { DateTime.now }

    factory :thing_with_bad_webhook_url do
      webhook_url { "DROP table;" }
    end

    factory :thing_scheduled_for_now do
      next_reminder { DateTime.now }
    end

    factory :thing_scheduled_for_future do
      next_reminder { DateTime.now + 500.days }
    end

    factory :thing_scheduled_for_past do
      next_reminder { DateTime.now - 500.days }
    end
  end
end
