require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  
  def setup
    session[:user_id] = users(:xavier) # logged in user
    @team = teams(:xmen)
  end
  
  def teardown
    @team = nil
  end
  
  test "setup fixture is valid" do
    assert @team.valid?   
  end
    
  test "should redirect to login_url if user is logged out" do
    session[:user_id] = nil
    get :index    
    assert_redirected_to login_url
  end

  test "should get index" do
    get :index
    assert_response :success    
    assert_not_nil assigns(:teams)
    assert_not_nil assigns(:entity)
    assert_template :index
    assert_template layout: "layouts/application"
    assert_select 'h1', 'Teams'
    assert_select 'div.container' do 
      assert_select 'div.thumbnail' ,Team.count
    end
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
    assert_not_nil assigns(:team)
    assert_template layout: "layouts/application"
    assert_select 'h1', 'New Team'
    assert_select 'form' do 
      assert_select 'div.form-group' ,4
    end
  end

  # TODO: Upload an image file
  test "should create team" do
    assert_difference('Team.count') do
      post :create, team: { name: 'New name', email: 'anemail@gmail.com', description: 'New description' }
    end
    assert_not_nil assigns(:team)
    assert_equal 'Team was successfully created.', flash[:success]
    assert_redirected_to team_path(assigns(:team))
  end

  test "should show team" do
    get :show, id: @team
    assert_response :success
    assert_not_nil assigns(:entity)
    assert_template 'shared/profile'
    assert_template layout: "layouts/application"
    assert_select 'h1', @team.name.camelize
    assert_select 'div.btn-group' do 
      assert_select 'a.btn', 'Edit this Team'
      assert_select 'a.btn', 'Back to Teams'
    end
    assert_select 'div[role=tabpanel]' do
      assert_select 'ul.nav' do
	      assert_select 'li[role=presentation]', 3
      end
      assert_select 'div.tab-pane#info'
      assert_select 'div.tab-pane#tasks'
      assert_select 'div.tab-pane#mutants'
    end
  end

  test "should get edit" do
    get :edit, id: @team
    assert_response :success
    assert_not_nil assigns(:team)
    assert_template :edit
    assert_template layout: "layouts/application"
    assert_select 'h1', 'Editing Team'
    assert_select 'form' do 
      assert_select 'div.form-group' ,4
    end
  end

  test "should update team" do
    patch :update, id: @team, team: { name: 'Updated name', email: 'noemail@nil.com', description: 'Other description' }
    assert_equal 'Team was successfully updated.', flash[:success]
    assert_redirected_to team_path(assigns(:team))
  end

  test "should destroy team" do
    assert_difference('Team.count', -1) do
      delete :destroy, id: @team
    end
    assert_equal 'Team was successfully destroyed.', flash[:success]
    assert_redirected_to teams_path
  end

  test "should unlink mutant from team" do
    assert_difference('@team.mutants.count', -1) do
      xhr :delete, :destroy, id: @team, mutant_id: mutants(:professorX).id
    end
    assert_not_nil assigns(:mutant)
    assert_not_nil assigns(:mutants_count)
    assert_not_nil assigns(:tasks_count)
    assert_not_nil assigns(:entity)
    assert_not_nil assigns(:mutants)
    assert_not_nil assigns(:selectable_mutants)
    assert_select_jquery :html, '#tasks_count'
    assert_select_jquery :html, '#mutants_count'
    assert_select_jquery :html, '#mutants'
  end
     
  test "should select mutants to assign" do
    xhr :get, :select_mutants, {id: @team.id}
    assert_not_nil assigns(:mutants)
    assert_not_nil assigns(:selectable_mutants)
    assert_template :select_mutants
    assert_select 'h4', /Assing Mutant to Team/
  end
  
  test "should assign a mutant" do
    assert_difference('@team.mutants.count') do
      xhr :get, :assign, {team_id:  @team.id, mutant_id: mutants(:wolwerine).id }
    end
    assert_not_nil assigns(:mutant)
    assert_not_nil assigns(:entity)
    assert_not_nil assigns(:mutants)
    assert_not_nil assigns(:selectable_mutants)  
    assert_template :assign
  end
end
