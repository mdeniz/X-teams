require 'test_helper'

class MutantsControllerTest < ActionController::TestCase

  def setup
    session[:user_id] = users(:xavier) # logged in user
    @mutant = mutants(:wolwerine)
  end

  def teardown
    @mutant = nil
  end

  test "setup fixture is valid" do
    assert @mutant.valid?
  end

  test "should redirect to login_url if user is logged out" do
    session[:user_id] = nil
    get :index
    assert_redirected_to login_url
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entity)
    assert_not_nil assigns(:mutants)
    assert_template :index
    assert_template layout: "layouts/application"
    assert_select 'h1', 'Mutants'
    assert_select 'div.container' do
      assert_select 'div.thumbnail' ,Mutant.count
    end
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
    assert_not_nil assigns(:mutant)
    assert_template layout: "layouts/application"
    assert_select 'h1', 'New Mutant'
    assert_select 'form' do
      assert_select 'div.form-group' ,15
    end
  end

  # TODO: Upload an image file
  test "should create mutant" do
    assert_difference('Mutant.count') do
      post :create, mutant: { name: 'New name', email: 'anemail@gmail.com', description: 'New description' }
    end
    assert_not_nil assigns(:mutant)
    assert_equal 'Mutant was successfully created.', flash[:success]
    assert_redirected_to mutant_path(assigns(:mutant))
  end

  test "should show mutant" do
    get :show, id: @mutant
    assert_response :success
    assert_not_nil assigns(:entity)
    assert_template 'shared/profile'
    assert_template layout: "layouts/application"
    assert_select 'h1', @mutant.name.camelize
    assert_select 'div.btn-group' do
      assert_select 'a.btn', 'Edit this Mutant'
      assert_select 'a.btn', 'Back to Mutants'
    end
    assert_select 'div[role=tabpanel]' do
      assert_select 'ul.nav' do
        assert_select 'li[role=presentation]', 4
      end
      assert_select 'div.tab-pane#info'
      assert_select 'div.tab-pane#biography'
      assert_select 'div.tab-pane#tasks'
      assert_select 'div.tab-pane#teams'
    end
  end

  test "should get edit" do
    get :edit, id: @mutant
    assert_response :success
    assert_not_nil assigns(:mutant)
    assert_template :edit
    assert_template layout: "layouts/application"
    assert_select 'h1', 'Editing Mutant'
    assert_select 'form' do
      assert_select 'div.form-group', 15
    end
  end

  test "should update mutant" do
    patch :update, id: @mutant, mutant: { name: 'Updated name' }
    assert_not_nil assigns(:mutant)
    assert_equal 'Mutant was successfully updated.', flash[:success]
    assert_redirected_to mutant_path(assigns(:mutant))
  end

  test "should destroy mutant" do
    assert_difference('Mutant.count', -1) do
      delete :destroy, id: @mutant
    end
    assert_not_nil assigns(:mutant)
    assert_equal 'Mutant was successfully destroyed.', flash[:success]
    assert_redirected_to mutants_path
  end

  test "should unlink team from mutant" do
    assert_difference('@mutant.teams.count', -1) do
      xhr :delete, :destroy, id: @mutant, team_id: teams(:xmen)
    end
    assert_not_nil assigns(:mutant)
    assert_not_nil assigns(:teams_count)
    assert_not_nil assigns(:tasks_count)
    assert_not_nil assigns(:tasks_unassigned)
    assert_select_jquery :html, '#tasks_count'
    assert_select_jquery :html, '#teams_count'
  end

end
