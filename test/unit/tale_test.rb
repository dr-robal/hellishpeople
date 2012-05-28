require 'test_helper'

class TaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :tales
  test "validate presence of content and description(valid)" do
    
    tale = tales(:one)
    assert_equal tale.valid?,true

  end
  test "validate presence of content and description(content invalid)" do
   
    tale = tales(:two)
    assert_equal tale.valid?,false

  end
  test "validate presence of content and description(description invalid)" do
   
    tale = tales(:three)
    assert_equal tale.valid?,false

  end
end
