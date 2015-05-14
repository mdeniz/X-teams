require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  
  def setup
    @membership = memberships(:one) # Using a valid fixture
  end
  
  def teardown
    @membership = nil
  end
  
  test "setup fixture is valid" do
    assert @membership.valid?   
  end
  
end
