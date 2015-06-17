require 'test_helper'

class StaticPageControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get trips" do
    get :trips
    assert_response :success
  end

  test "should get fairs" do
    get :fairs
    assert_response :success
  end

  test "should get museums" do
    get :museums
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get tips" do
    get :tips
    assert_response :success
  end

end
