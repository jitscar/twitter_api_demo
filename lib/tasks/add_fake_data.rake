namespace :add_fake_data do
  desc "add fake data for users and messages"

  task all: :environment do
    add_users
    add_messages
    add_messages_to_favorites
  end

  task only_new_messages: :environment do
    create_new_messages
  end

  def add_users
    FactoryGirl.create_list(:user, 15)
  end

  def add_messages
    create_old_messages
    create_new_messages
  end

  def add_messages_to_favorites
    Message.find_each do |message|
      rand(0..User.count).times do
        random_user.add_message_to_favorites(message)
      end
    end
  end

  def create_old_messages
    User.find_each do |user|
      FactoryGirl.create_list(:message, rand(5..50), user_id: user.id, created_at: rand(2.week).seconds.ago)
    end
  end

  def create_new_messages
    User.find_each do |user|
      FactoryGirl.create_list(:message, rand(1..10), user_id: user.id)
    end
  end

  def random_user
    User.offset(rand(User.count)).first
  end
end
