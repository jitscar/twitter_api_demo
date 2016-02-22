class User < ActiveRecord::Base
  has_many :messages
  has_many :favorite_messages
  has_many :favorites, through: :favorite_messages, source: :message

  validates :email, presence: true
  validates :name, presence: true
end
