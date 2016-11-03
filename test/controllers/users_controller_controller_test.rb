require 'test_helper'

class UsersControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get users_controller_create_url
    assert_response :success
  end

  test "should get show" do
    get users_controller_show_url
    assert_response :success
  end

  test "should get update" do
    get users_controller_update_url
    assert_response :success
  end

  test "should get destroy" do
    get users_controller_destroy_url
    assert_response :success
  end

end
