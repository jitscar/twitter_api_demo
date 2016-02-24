require 'rails_helper'

RSpec.describe AverageRating do
  let(:user) { FactoryGirl.create(:user, messages_count: 2) }

  before(:each) do
    FactoryGirl.create_list(:message, 2, user_id: user.id, favorites_count: 5)
  end

  it 'calculates value' do
    expect(AverageRating.send(:calculate_rating, user)).to eq 5.0
  end

  it 'updates column avg_rating' do
    AverageRating.update(user)
    expect(User.first.avg_rating).to eq 5.0
  end
end
