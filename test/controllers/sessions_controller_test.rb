require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
    assert_template layout: "layouts/application"
    assert_select 'h1', 'Log in'
    assert_select 'form' do
      assert_select 'input.form-control' ,2
    end
  end

  test "should log in with right email and password" do
    post :create, session: { email: 'xavier@xmen.com', password: 'professor'}
    assert_not_nil session[:user_id]
    assert_equal 'Welcome to X-Teams', flash[:success][0,18]
    assert_redirected_to root_url
  end


  test "should show error with bad email or password" do
    post :create, session: { email: 'noemail@nil.com', password: 'professor'}
    assert_nil session[:user_id]
    assert_template :new
  end

  test "should destroy active session" do
    session[:user_id] = users(:xavier) # logged in user
    post :destroy
    assert_nil session[:user_id]
    assert_redirected_to root_url
  end

end
