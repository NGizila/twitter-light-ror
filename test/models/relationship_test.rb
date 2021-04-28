require "test_helper"

class RelationshipTest < ActiveSupport::TestCase
  
  def setup
    @relationship = Relationship.new(follower_id:1, followed_id: 2)
  end

  test "should be not saved without ids" do
    relationship = Relationship.new
    assert_not relationship.save
  end

  test "should require a follower_id" do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  test "should require a followed_id" do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end
end
