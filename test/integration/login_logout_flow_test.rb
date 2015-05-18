require 'test_helper'

class LoginLogoutFlowTest < ActionDispatch::IntegrationTest

  test "homepage, login and logout" do
      #Homepage logged out
      get root_url
      assert_response :success
      assert_not @controller.logged_in?
      assert_template :home
      assert_template layout: "layouts/application"
      assert_select 'h1', 'Welcome to X-Teams'

      #Login form
      get '/login'
      assert_response :success
      assert_template :new
      assert_template layout: "layouts/application"

      #Login form sent
      post '/login', session: { email: 'xavier@xmen.com', password: 'professor'}
      assert @controller.logged_in?
      assert_equal 'Welcome to X-Teams', flash[:success][0,18]
      assert_redirected_to root_url

      #Homepage logged in
      follow_redirect!
      assert @controller.logged_in?
      assert_not_nil assigns(:teams)
      assert_not_nil assigns(:team)
      assert_not_nil assigns(:mutants)
      assert_not_nil assigns(:mutant)
      assert_select 'h4' do
          assert_select 'a'
      end

      #Logout
      delete '/logout'
      assert_not @controller.logged_in?
      assert_redirected_to root_url

      #Homepage logged out again
      follow_redirect!
      assert_response :success
      assert_not @controller.logged_in?
      assert_template :home
      assert_template layout: "layouts/application"
      assert_select 'h1', 'Welcome to X-Teams'
  end

end
