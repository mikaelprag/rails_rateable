module RailsRateable
  extend ActiveSupport::Concern

  included do
    has_one :rating, :as => :rateable, :dependent => :destroy
  end

  module ClassMethods
    #put class method here to be trigger as say User.method_name
    def rails_rateable(options = {})
      unless respond_to?(:max_rating)
        class_attribute :max_rating
        self.max_rating = options[:max_rating] || 5
      end
    end
    
    def find_top_rated(limit = nil)
      limit = 20 unless limit
      includes(:rating).order('ratings.average_rating DESC').limit(limit)
    end
    
  end

  # Rates the object by a given score. A user object should be passed to the method.
  def rate_it(score, user)
    create_rating unless rating
    rating.rate(score, user)
  end

  # Returns the average rating. Calculation based on the already given scores.
  def average_rating
    rating && rating.average_rating || 0.0
  end

  # Rounds the average rating value.
  def average_rating_round
    average_rating.round
  end

  # Returns the average rating in percent.
  def average_rating_percent
    f = 100 / max_rating.to_f
    average_rating * f
  end

  # Returns the number of ratings.
  def ratings_count
    rating && rating.ratings_count || 0
  end

  # Checks whether a user rated the object or not.
  def rated_by?(user)
    rating && rating.user_ratings.exists?(:user_id => user)
  end

  # Returns the rating a specific user has given the object.
  def rating_by(user)
    user_rating = rating && rating.user_ratings.find_by_user_id(user.id)
    user_rating ? user_rating.score : nil
  end
  
end
