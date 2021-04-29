class Tweet < ApplicationRecord
  #newest tweet on top
  default_scope {order(created_at: :desc)}
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 240, too_long: "A tweet length can't superior than %{count} characters !" }

  #has_and_belongs_to_many :tags, dependent: :destroy
  has_many :tweet_tags
  has_many :tags, through: :tweet_tags
  #self id because it's in tweet so we want Tweet's id
  after_commit :create_tags, on: :create

  #after_create do
  def create_tags
    tweet = Tweet.find_by(id: self.id)
    hashtags = self.content.scan(/#\w+/)
    #fetching all hashtags with regex, all hashtags are unique
    hashtags.map do |hashtag|
      #avoiding duplications and keeping all type of text(reason why downcase)
      tag = Tag.create(name: hashtag.downcase.delete('#'))
      tweet.tags << tag 
    end
  end
  
end

