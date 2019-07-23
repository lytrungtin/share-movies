require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_match Share.count.to_s, response.body
    Share.paginate(page: 1).each do |share|
      assert_match share.uid, response.body
    end
  end
end
