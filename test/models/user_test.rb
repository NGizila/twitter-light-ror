require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.new(tweetname: "SpiderMan",img_url:"test_img_url.com")
  end
  
  test "should be valid" do
    assert @user.valid?
  end

  test "tweetname should be present" do
    assert @user.tweetname = "  "
    assert_not @user.valid?
  end

  test "tweetname shouldn't be too long" do
    assert @user.tweetname = "a"*100
    assert_not @user.valid?
  end

  test "img_url shouldn't be too long" do
    assert @user.img_url = "a"*500
    assert_not @user.valid?
  end

  test "tweetname should be unique" do
    duplicate_user = @user.dup
    duplicate_user.tweetname = @user.tweetname.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "deleting user should destroy their tweets" do
    @user.save
    @user.tweets.create!(content: "Where's my ship")
    assert_difference 'Tweet.count',-1 do
      @user.destroy
    end
  end

  test "user should be able to follow and unfollow other users" do
    testuser = users(:testuser)
    imposter = users(:imposter)
    assert_not testuser.following?(imposter)
    testuser.follow(imposter)
    assert testuser.following?(imposter)
    assert imposter.followers.include?(testuser)
    testuser.unfollow(imposter)
    assert_not testuser.following?(imposter)
  end

end
