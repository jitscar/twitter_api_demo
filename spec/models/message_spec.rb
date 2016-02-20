require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:user) {
    FactoryGirl.create(:user)
  }

  let(:message) {
    FactoryGirl.build(:message, user_id: user.id)
  }

  describe "db structure" do
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:content).of_type(:string) }
    it { is_expected.to have_db_column(:like).of_type(:boolean) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_length_of(:content).is_at_most(140) }
  end

  describe "object" do
    it "can be created" do
      expect { message.save! }.to change(Message, :count).by(1)
    end
  end

  describe "is invalid" do
    it "without user" do
      message.user = nil
      expect(message).to be_invalid
    end

    it "without content" do
      message.content = nil
      expect(message).to be_invalid
    end
  end

  it "is completely valid" do
    expect(message).to be_valid
  end
end
