require 'test_helper'

class AdControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get remove" do
    get :remove
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
