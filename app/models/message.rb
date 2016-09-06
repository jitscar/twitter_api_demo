class Message < ActiveRecord::Base
  belongs_to :user, counter_cache: true
  has_many :favorite_messages
  has_many :favorited_by, through: :favorite_messages, source: :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  after_create do
    AverageRating.update(user)
  end

  scope :favorites_count_top, -> { order('messages.favorites_count DESC').limit(5) }
end
