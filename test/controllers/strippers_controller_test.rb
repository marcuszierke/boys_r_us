require 'test_helper'

class StrippersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get strippers_index_url
    assert_response :success
  end

  test "should get show" do
    get strippers_show_url
    assert_response :success
  end

  test "should get update" do
    get strippers_update_url
    assert_response :success
  end

  test "should get edit" do
    get strippers_edit_url
    assert_response :success
  end

end
