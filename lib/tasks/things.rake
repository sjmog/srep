require 'net/http'

namespace :things do
  desc 'fire a request to the webhook for things that are ready for one'
  task :remember => :environment do
    Thing.scheduled_for_remembering.each do |thing|
      uri = URI(thing.webhook_url)
      response = Net::HTTP.post(uri, thing.text)

      p thing

      thing.webhook_responses.create(data: response)
    end
  end
end