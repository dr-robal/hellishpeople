require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :comments
  test "validate presence of comment body(valid)" do
    
    comment = comments(:one)
    assert_equal comment.valid?,true

  end
  test "validate presence of comment body(invalid)" do
   
    comment = comments(:two)
    assert_equal comment.valid?,false

  end
end
