class AddMessageCounterToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :messages_count, :integer, :default => 0

    User.reset_column_information
    User.find_each do |user|
      User.update_counters user.id, messages_count: user.messages.count
    end
  end

  def self.down
    remove_column :users, :messages_count
  end
end
