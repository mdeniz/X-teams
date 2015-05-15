require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  test "should get about page successfully" do
    get :about
    assert_response :success
    assert_template :about
    assert_template layout: "layouts/application"
  end
  
  test "should get contact page successfully" do
    get :contact
    assert_response :success
    assert_template :contact
    assert_template layout: "layouts/application"
  end
  
  test "should get help page successfully" do
    get :help
    assert_response :success
    assert_template :help
    assert_template layout: "layouts/application"
  end
  
  test "should get home page successfully" do
    get :home
    assert_response :success
    assert_template :home
    assert_template layout: "layouts/application"
  end
    
  test "home page should do assigns if user is logged in" do
    session[:user_id] = users(:xavier).id
    get :home
    assert @controller.logged_in?
    assert_not_nil assigns(:teams)
    assert_not_nil assigns(:team)
    assert_not_nil assigns(:mutants)
    assert_not_nil assigns(:mutant)
  end
    
  test "home page shouldn't do assigns if user is logged out" do
    session[:user_id] = nil
    get :home
    assert_not @controller.logged_in?
    assert_nil assigns(:teams)
    assert_nil assigns(:team)
    assert_nil assigns(:mutants)
    assert_nil assigns(:mutant)
  end
  
  # Views tests
    
  test "home page should show a thumbnail menu if user is logged in" do
    session[:user_id] = users(:xavier).id
    get :home
    assert @controller.logged_in?
    assert_select 'h4' do 
      assert_select 'a'
    end
  end  

      
  test "home page should show a welcome message if user is logged out" do
    session[:user_id] = nil
    get :home
    assert_not @controller.logged_in?
    assert_select 'h1', 'Welcome to X-Teams'
  end  
  
  test "help page should show a help title and text" do
    get :help
    assert_select 'h1', 'Help'
    assert_select 'div.jumbotron'
  end
  
  test "about page should show a about title, text and tags" do
    get :about
    assert_select 'h1', 'About'
    assert_select 'div.jumbotron'
    assert_select 'span.tossing' do
      assert_select 'span.label', 'Ruby'
      assert_select 'span.label', 'Ruby on Rails'
      assert_select 'span.label', 'HAML'
      assert_select 'span.label', 'YAML'
      assert_select 'span.label', 'ERB'
      assert_select 'span.label', 'SCSS'
      assert_select 'span.label', 'jQuery'
      assert_select 'span.label', 'JS/CoffeScript'
    end    
  end
  
  test "contact page should show a contact title, an image, a text and a link to a CV" do
    get :contact
    assert_select 'h1', 'Contact & CV'
    assert_select 'div.jumbotron'
    assert_select 'img.img-thumbnail'
    assert_select 'a', 'Curriculum Vitae'
  end    
end
