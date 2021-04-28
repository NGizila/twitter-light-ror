class User < ApplicationRecord
	validates :tweetname, presence: true, length: { maximum:50},uniqueness: { case_sensitive: false }
 	validates :img_url, presence: true, length: { maximum: 450 }

	has_many :tweets, dependent: :destroy #remove user's tweet
	has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy #when user deleted we want this relationship to disappear
	has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id",dependent: :destroy
	
	has_many :following, through: :active_relationships, source: :followed 
	#differencing active from passive relationships, passive when someone is following use and active when we follow someone
	has_many :followers, through: :passive_relationships, source: :follower


	#helper methods, only for active components
	#follow another user
	def follow(other)
		active_relationships.create(followed_id: other.id)
	end

	#unfollow a user
	def unfollow(other)
		active_relationships.find_by(followed_id: other.id).destroy
	end

	#is following user? || returns boolean
	def following?(other)
		following.include?(other)
	end
end
