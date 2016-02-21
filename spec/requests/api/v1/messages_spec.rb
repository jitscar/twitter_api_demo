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

      post '/api/v1/messages', params, request_headers

      expect(response).to have_http_status(:created)
      expect(Message.first.content).to eq 'Hello, beaver!'
    end
  end

  describe "PUT /mark_as_liked" do
    it "updates a message with like true" do
      FactoryGirl.create(:message, user_id: FactoryGirl.create(:user).id)

      put "/api/v1/messages/#{Message.first.id}/mark_as_liked"

      expect(response).to have_http_status(:ok)
      expect(Message.first.like).to be_truthy
    end
  end
end