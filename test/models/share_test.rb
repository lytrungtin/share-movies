require 'test_helper'

class ShareTest < ActiveSupport::TestCase

  def setup
    @user = users(:tintin)
    # This code is not idiomatically correct.
    @share = @user.shares.build(url: "https://www.youtube.com/watch?v=qAQHz2zPFFQ")
  end

  test "should be valid" do
    assert @share.valid?
  end

  test "user id should be present" do
    @share.user_id = nil
    assert_not @share.valid?
  end

  test "order should be most recent first" do
    assert_equal shares(:cho_toi_lang_thang), Share.first
  end
end
