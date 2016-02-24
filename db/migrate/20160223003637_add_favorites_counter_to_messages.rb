class AddFavoritesCounterToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :favorites_count, :integer, default: 0

    Message.reset_column_information
    Message.find_each do |message|
      Message.update_counters message.id, favorites_count: message.favorite_messages.count
    end
  end

  def self.down
    remove_column :messages, :favorites_count
  end
end
