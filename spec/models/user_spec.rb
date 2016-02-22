require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.build(:user) }

  describe "db structure" do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "associations" do
    it { is_expected.to have_many(:messages) }
    it { is_expected.to have_many(:favorite_messages) }
    it { is_expected.to have_many(:favorites).through(:favorite_messages).source(:message) }
  end

  describe "object" do
    it "can be created" do
      expect { user.save! }.to change(User, :count).by(1)
    end

    it "has an array of messages" do
      expect(user.messages).to eq([])
    end
  end

  describe "is invalid" do
    it "without email" do
      user.email = nil
      expect(user).to be_invalid
    end

    it "without name" do
      user.name = nil
      expect(user).to be_invalid
    end
  end

  it "is completely valid" do
    expect(user).to be_valid
  end
end
