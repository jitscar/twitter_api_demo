module AverageRating
  def self.update(user)
    user.update_attribute(:avg_rating, calculate_rating(user))
  end

  def self.calculate_rating(user)
    Message.where(user_id: user.id).sum(:favorites_count).to_f / user.messages_count.to_f
  end

  private_class_method :calculate_rating
end
