require 'rails_helper'

RSpec.describe API::V1::MessagesController, type: :controller do
  let(:valid_attributes) { FactoryGirl.attributes_for(:message, user_id: FactoryGirl.create(:user).id) }
  let(:invalid_attributes) { { content: nil, user_id: nil } }
  let!(:message) { Message.create(valid_attributes) }

  describe 'GET #index' do
    it 'returns http success' do
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Message' do
        expect do
          post :create, message: valid_attributes, format: :json
        end.to change(Message, :count).by(1)
      end

      it 'assigns a newly created message as @message' do
        post :create, message: valid_attributes, format: :json
        expect(assigns(:message)).to be_a(Message)
        expect(assigns(:message)).to be_persisted
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved message as @message' do
        post :create, message: invalid_attributes, format: :json
        expect(assigns(:message)).to be_a_new(Message)
      end

      it 'returns unprocessable_entity status' do
        put :create, message: invalid_attributes, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #favorite' do
    let(:favorite_action) { -> { put :favorite, id: message.id, format: :json } }
    context 'with valid params' do
      it 'updates the requested message as favorited' do
        expect(favorite_action).to change(message.favorite_messages, :count).by(1)
        expect(favorite_action).to change(message.favorited_by, :count).by(1)
      end
    end
  end
end
