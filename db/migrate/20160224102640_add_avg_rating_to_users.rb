class AddAvgRatingToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :avg_rating, :decimal, default: 0.0

    User.reset_column_information
    User.find_each do |user|
      AverageRating.update(user)
    end
  end

  def self.down
    remove_column :users, :avg_rating
  end
end
