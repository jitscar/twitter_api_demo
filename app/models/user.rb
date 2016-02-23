class User < ActiveRecord::Base
  scope :messages_count_top, -> { order('users.messages_count DESC').limit(5) }

  has_many :messages
  has_many :favorite_messages
  has_many :favorites, through: :favorite_messages, source: :message

  validates :email, presence: true
  validates :name, presence: true

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  def add_message_to_favorites(message)
    favorites << message
  end
end
