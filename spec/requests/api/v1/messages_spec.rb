require 'rails_helper'

describe 'Messages API' do
  describe "GET /messages" do
    it "gets a list of messages" do
      FactoryGirl.create_list(:message, 10)

      get '/api/v1/messages'

      json = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(json.length).to eq(10)
    end
  end

  describe "POST /messages" do
    it "creates a message" do
      params = {
          message: {
              content: 'Hello, beaver!',
              user_id: FactoryGirl.create(:user).id
          }
      }.to_json

      request_headers = {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
      }

      post '/api/v1/messages', params, request_headers

      expect(response).to have_http_status(:created)
      expect(Message.first.content).to eq 'Hello, beaver!'
    end
  end
end