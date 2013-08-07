require 'test_helper'

class ThoughtControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  text "should get random" do
    get :random
    assert_response :success
  end

end
