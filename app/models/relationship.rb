class Relationship < ApplicationRecord
    attr_accessor :followed_id

    belongs_to :follower, class_name:"User"
    belongs_to :followed, class_name:"User"

    #making sure that those ids exists
    #validates :follower_id, presence=true 
    #validates :followed_id, presence=true 
end
