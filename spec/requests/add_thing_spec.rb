require 'rails_helper'

RSpec.describe "adding a thing to the spaced repetition queue", :type => :request do
  before do
    thing = FactoryBot.build(:thing)

    post '/api/v1/things', params: { thing: thing.as_json(except: [:id, :created_at, :updated_at]) }
  end

  it 'adds the thing to the srep queue' do
    expect(Thing.last.text).to eq("Hello, World!")
  end

  it 'returns a unique ID for the thing' do
    expect(JSON.parse(response.body)["id"]).to eq(Thing.last.id)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end