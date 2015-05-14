require 'test_helper'

class AssignationTest < ActiveSupport::TestCase
  
  def setup
    @assignation = assignations(:one) # Using a valid fixture
  end
  
  def teardown
    @assignation = nil
  end
  
  test "setup fixture is valid" do
    assert @assignation.valid?   
  end
  
end
