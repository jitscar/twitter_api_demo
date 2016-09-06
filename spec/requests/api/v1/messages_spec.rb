require 'rails_helper'

describe 'Messages API' do
  describe 'GET /messages' do
    it 'gets list of messages' do
      FactoryGirl.create_list(:message, 10)

      get '/api/v1/messages'

      json = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(json.length).to eq(10)
    end
  end

  describe 'POST /messages' do
    it 'creates message' do
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

  describe 'PUT /favorite' do
    it 'updates message as favorited' do
      FactoryGirl.create(:message, user_id: FactoryGirl.create(:user).id)

      put "/api/v1/messages/#{Message.first.id}/favorite"

      expect(response).to have_http_status(:ok)
      expect(Message.first.favorite_messages.count).to eq 1
      expect(Message.first.favorited_by.count).to eq 1
    end
  end
end
