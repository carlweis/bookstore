require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should signin" do
    user = users(:one)
    post :create, name: user.name, password: 'secret'
    assert_redirected_to admin_url
    assert_equal user.id, session[:user_id]
  end

  test "should fail signin" do
    user = users(:one)
    post :create, name: user.name, password: 'wrong'
    assert_redirected_to login_url
  end

  test "should signout" do
    get :destroy
    assert_redirected_to store_url
    assert_equal flash[:notice], 'Signed out'
  end

end
