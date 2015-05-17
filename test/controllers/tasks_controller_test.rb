require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  
  def setup
    session[:user_id] = users(:xavier) # logged in user
    @task = tasks(:world_peace)
  end
  
  def teardown
    @task = nil
  end
  
  test "setup fixture is valid" do
    assert @task.valid?   
  end
    
  test "should redirect to login_url if user is logged out" do
    session[:user_id] = nil
    get :new    
    assert_redirected_to login_url
  end

  test "should get new" do
    xhr :get, :new, team_id: teams(:xmen)
    assert_response :success
    assert_not_nil assigns(:task)
    assert_not_nil assigns(:team)
    assert_template :new, partial: '_form'
    assert_select_jquery :html, '#task_form' do
      assert_select 'h4', /New Task of Team/
      assert_select 'form' do
        assert_select 'div.form-group', 6
        assert_select 'input.form-control', 5
        assert_select 'textarea.form-control' ,1
      end
    end
  end

  test "should get edit" do
    xhr :get, :edit, id: @task, team_id: teams(:xmen)
    assert_response :success
    assert_not_nil assigns(:team)
    assert_template :edit, partial: '_form'
    assert_select_jquery :html, '#task_form' do
      assert_select 'h4', /Edit Task of Team/
      assert_select 'form' do
        assert_select 'div.form-group', 6
        assert_select 'input.form-control', 5
        assert_select 'textarea.form-control' ,1
      end
    end
  end
     
  test "should select mutants to assign" do
    xhr :get, :select_mutants, id: @task
    assert_not_nil assigns(:selectable_mutants)
    assert_template :select_mutants
    assert_select_jquery :html, '#mutant_select' do
      assert_select 'h4', /Assing Mutant to Task/
      assert_select 'div.thumbnail', assigns(:selectable_mutants).count
    end

  end  
       
  test "should select mutants to unassign" do
    xhr :get, :select_mutants_to_unassign, id: @task
    assert_not_nil assigns(:selectable_mutants)
    assert_template :select_mutants_to_unassign
    assert_select_jquery :html, '#mutant_select' do
      assert_select 'h4', /Unassing Mutant from Task/
      assert_select 'div.thumbnail', assigns(:selectable_mutants).count
    end
  end
    
  test "should assign a mutant" do
    assert_difference('@task.mutants.count') do
      xhr :get, :assign, id:  @task, mutant_id: mutants(:wolwerine)
    end
    assert_not_nil assigns(:mutant)
    assert_not_nil assigns(:entity)
    assert_template :assign
    assert_select_jquery :html, '#tasks'
  end
    
  test "should unassign a mutant" do
    assert_difference('@task.mutants.count', -1) do
      xhr :get, :unassign, id:  @task, mutant_id: mutants(:wolwerine)
    end
    assert_not_nil assigns(:mutant)
    assert_not_nil assigns(:entity)
    assert_template :assign
    assert_select_jquery :html, '#tasks'
  end  
  
  test "should create a task" do
    assert_difference('Task.count') do
      xhr :post, :create, team: {id: teams(:xmen)}, task: { name: 'New task name', description: 'New task description', achieved: 50, priority: 50 }
    end
    assert_not_nil assigns(:task)
    assert_not_nil assigns(:team)
    assert_not_nil assigns(:entity)
    assert_template :create
    assert_select_jquery :html, '#tasks' do
      assert_select "div.task_bar#task_item_id_#{assigns(:task).id}"
    end
  end

  test "should update task" do
    xhr :patch, :update, id: @task, team: {id: teams(:xmen)}, task: {name: 'Updated name', description: 'Other description', achieved: 57, priority: 70  }
    assert_not_nil assigns(:task)
    assert_not_nil assigns(:team)
    assert_not_nil assigns(:entity)
    assert_template :update    
    assert_select_jquery :html, '#tasks' do
      assert_select "div.task_bar#task_item_id_#{assigns(:task).id}"
    end
  end
  
  test "should step achievement" do
    xhr :get, :step, id:  @task, step: 10
    assert assigns(:task).achieved, @task.achieved + 10
    assert assigns(:task).achieved <=100.0
    assert assigns(:task).achieved >= 0.0
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      xhr :delete, :destroy, id: @task
    end
    assert_not_nil assigns(:task)
    assert_not_nil assigns(:tasks_count)
    assert_template :destroy
    assert_select_jquery :html, '#tasks_count'
  end
   
end
