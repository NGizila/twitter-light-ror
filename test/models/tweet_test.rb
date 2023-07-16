require "test_helper"

class TweetTest < ActiveSupport::TestCase
  def setup
    @user = users(:testuser)
    @tweet = @user.tweets.build(content: "test content lorem ipsum #taaaag")
  end

  test "should be valid" do
    assert @tweet.valid?
  end
  
  test "user id should be present" do
    @tweet.user_id = nil
    assert_not @tweet.valid?
  end

  test "tweet shouldn't have more than 240 chars" do
    @tweet.content = "a" * 244
    assert_not @tweet.valid?
  end

  test "tweet shouldn't be empty" do
    @tweet.content = "  "
    assert_not @tweet.valid?
  end 

  test "tweets should be ordered by their recency" do
    assert_equal Tweet.first, tweets(:most_recent)
  end

  test "tag should be extracted from a tweet" do 
    @hashtags = @tweet.content.scan(/#\w+/)
    @hashtags.map do |hashtag|
      @t = Tag.create(name: hashtag.downcase.delete('#'))
      @tweet.tags << @t
    end
    assert @tweet.tags.present?
  end

end
