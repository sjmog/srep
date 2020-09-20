require 'rails_helper'

RSpec.describe "firing a request to a webhook when it's time to remember a thing in the queue" do
  let(:thing) { FactoryBot.create(:thing) }

  before do
    Rails.application.load_tasks

    stub_request(:post, thing.webhook_url).
          with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}, body: thing.text).
          to_return(status: 200, body: "stubbed response", headers: {})

    Rake::Task['things:remember'].invoke
  end

  it 'fires a request according to a srep schedule' do
    expect(a_request(:post, thing.webhook_url).with { |req| req.body == thing.text }).
      to have_been_made
  end

  it 'stores the response on a list against the thing' do
    response = thing.webhook_responses.last

    expect(response.created_at).to eq DateTime.now
    expect(response.status).to eq 200
    expect(response.body).to eq "stubbed response"
    expect(response.headers).to eq {}
  end
end