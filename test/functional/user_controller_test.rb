require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get to_admin" do
    get :to_admin
    assert_response :success
  end

  test "should get to_moderator" do
    get :to_moderator
    assert_response :success
  end

  test "should get remove" do
    get :remove
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

end
