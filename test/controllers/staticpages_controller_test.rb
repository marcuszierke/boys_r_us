require 'test_helper'

class StaticpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staticpages_index_url
    assert_response :success
  end

end
