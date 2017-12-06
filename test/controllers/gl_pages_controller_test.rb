require 'test_helper'

class GlPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get gl_pages_home_url
    assert_response :success
  end
end