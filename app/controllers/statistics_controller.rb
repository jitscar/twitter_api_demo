class StatisticsController < ApplicationController
  def index
    @users_by_messages_count = User.messages_count_top
    @messages_by_favorites_count = Message.favorites_count_top
    @users_by_avg_rating = User.avg_rating_top
  end
end
