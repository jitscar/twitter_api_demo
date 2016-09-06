require 'rails_helper'

RSpec.describe FavoriteMessage, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:message) { FactoryGirl.create(:message, user: user) }
  let(:favorite_message) { FactoryGirl.build(:favorite_message, message: message, user: user) }

  describe 'db structure' do
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:message_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:message) }
  end

  describe 'object' do
    it 'can be created' do
      expect { favorite_message.save! }.to change(FavoriteMessage, :count).by(1)
    end
  end
end
