require "test_helper"

class TagTest < ActiveSupport::TestCase
  def setup
    @tag = Tag.new(name: "Avengers")
  end
  
  test "should be valid" do
    assert @tag.valid?
  end
end
