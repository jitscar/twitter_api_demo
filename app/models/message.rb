class Message < ActiveRecord::Base
  scope :favorites_count_top, -> { order('messages.favorites_count DESC').limit(5) }

  belongs_to :user, counter_cache: true
  has_many :favorite_messages
  has_many :favorited_by, through: :favorite_messages, source: :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
