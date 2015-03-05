require 'test_helper'

class MutantsControllerTest < ActionController::TestCase
  setup do
    @mutant = mutants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mutants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mutant" do
    assert_difference('Mutant.count') do
      post :create, mutant: {  }
    end

    assert_redirected_to mutant_path(assigns(:mutant))
  end

  test "should show mutant" do
    get :show, id: @mutant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mutant
    assert_response :success
  end

  test "should update mutant" do
    patch :update, id: @mutant, mutant: {  }
    assert_redirected_to mutant_path(assigns(:mutant))
  end

  test "should destroy mutant" do
    assert_difference('Mutant.count', -1) do
      delete :destroy, id: @mutant
    end

    assert_redirected_to mutants_path
  end
end
