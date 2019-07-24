require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Funny Movies"
    @user = users(:tintin)
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get share" do
    get share_path
    assert_redirected_to root_url
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }

    get share_path
    assert_response :success
    assert_select "title", "Share | #{@base_title}"
  end

end
