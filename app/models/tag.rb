class Tag < ApplicationRecord
    #has_and_belongs_to_many :tweets
    has_many :tweet_tags
    has_many :tweets, through: :tweet_tags
end
