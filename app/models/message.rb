class Message < ActiveRecord::Base
  belongs_to :user
  has_many :favorite_messages
  has_many :favorited_by, through: :favorite_messages, source: :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def favorite
    favorite_messages << FavoriteMessage.new
  end
end
