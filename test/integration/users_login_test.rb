require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "login with invalid information" do
    get root_path
    assert_template 'static_pages/home'
    post login_path, params: { session: { email: "", password: "" } }
    assert_not flash.empty?
  end

  test "login with valid information" do
    get root_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to root_url
    follow_redirect!
    assert_template 'static_pages/home'
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", share_path
  end

  test "login with valid information followed by logout" do
    get root_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_template 'static_pages/home'
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", share_path
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", share_path, count: 0
  end
end
