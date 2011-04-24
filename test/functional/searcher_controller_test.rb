require 'test_helper'

class SearcherControllerTest < ActionController::TestCase
  test "should get main" do
    get :main
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

end
