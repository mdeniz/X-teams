require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  def setup
    @task = tasks(:world_peace) # Using a valid fixture
  end
  
  def teardown
    @task = nil
  end
  
  test "setup fixture is valid" do
    assert @task.valid?   
  end
  
  # Properties validations tests
  
  test "should be invalid if name is missing" do
     @task.name = nil
     assert @task.invalid?   
  end
        
  test "should be invalid if name exceeds max length" do
    @task.name = 'a' * 51
    assert  @task.invalid?
  end

  
  test "should be invalid if achieved is missing" do
     @task.achieved = nil
     assert @task.invalid?   
  end

  
  test "should be invalid if priority is missing" do
     @task.priority = nil
     assert @task.invalid?   
  end
          
  # Methods tests
  
  test "color is included in the color possible values" do 
    10.times do |i|
      @task.priority = i * 11    
      assert_includes ['-success','','-info','-warning','-danger'], @task.color
    end
  end
  
  
  test "priority text is included in the priority text possible values" do 
    10.times do |i|
      @task.priority = i * 11    
      assert_includes ['lowest','low','medium','high','highest'], @task.priority_text
    end
  end
  
end
