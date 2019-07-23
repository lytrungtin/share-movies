require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:tintin)
  end

  test "invalid signup information" do
    get root_path
    assert_no_difference 'User.count' do
      post login_path, params: { session: { email: "user@invalid",
                                         password:              ""} }
    end
    follow_redirect!
    assert_template 'static_pages/home'
    assert_not is_logged_in?
  end

  test "valid signup information" do
    get root_path
    assert_difference 'User.count', 1 do
      post login_path, params: { session: { email: "user@example.com",
                                         password:              "password" } }
    end
    follow_redirect!
    assert_template 'static_pages/home'
    assert is_logged_in?
  end
end
