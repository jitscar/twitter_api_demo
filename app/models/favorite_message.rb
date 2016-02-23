class FavoriteMessage < ActiveRecord::Base
  belongs_to :message, counter_cache: :favorites_count
  belongs_to :user
end
