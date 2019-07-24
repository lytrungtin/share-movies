require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Funny Movies"
    assert_equal full_title("Help"), "Help | Funny Movies"
  end
end