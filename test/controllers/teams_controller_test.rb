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
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team" do
    assert_difference('Team.count') do
      post :create, team: { name: 'New name', email: 'anemail@gmail.com', description: 'New description' }
    end

    assert_redirected_to team_path(assigns(:team))
  end

  test "should show team" do
    get :show, id: @team
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team
    assert_response :success
  end

  test "should update team" do
    patch :update, id: @team, team: { name: 'Updated name', email: 'noemail@nil.com', description: 'Other description' }
    assert_redirected_to team_path(assigns(:team))
  end

  test "should destroy team" do
    assert_difference('Team.count', -1) do
      delete :destroy, id: @team
    end

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
  end
     
  test "should select mutants to assign" do
    xhr :get, :select_mutants, {id: @team.id}
    assert_not_nil assigns(:mutants)
    assert_not_nil assigns(:selectable_mutants)    
  end
  
  test "should assign a mutant" do
    assert_difference('@team.mutants.count') do
      xhr :get, :assign, {team_id:  @team.id, mutant_id: mutants(:wolwerine).id }
    end
    assert_not_nil assigns(:mutant)
    assert_not_nil assigns(:entity)
    assert_not_nil assigns(:mutants)
    assert_not_nil assigns(:selectable_mutants)  
  end
  
end
