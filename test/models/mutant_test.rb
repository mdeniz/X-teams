require 'test_helper'

class MutantTest < ActiveSupport::TestCase

  def setup
    @mutant = mutants(:wolwerine) # Using a valid fixture
  end
  
  def teardown
    @mutant = nil
  end
  
  test "setup fixture is valid" do
    assert @mutant.valid?   
  end
  
  # Properties tests
  
  test "should be invalid if name is missing" do
     @mutant.name = nil
     assert @mutant.invalid?   
  end
    
  test "should be invalid if name is not unique ignoring case sensitivity" do
    identical = @mutant.dup
    assert identical.invalid?, "Name not unique using same case"
    
    identical_with_name_uppercase = @mutant.dup
    identical_with_name_uppercase.name.upcase!
    assert identical_with_name_uppercase.invalid?, "Name not unique using different case"
  end
  
  # Methods tests
  
  test "image in asset should be nil if image attribute is nil" do 
    @mutant.image = nil
    assert_nil @mutant.image_in_asset
  end
  
  test "image in asset should be a string starting whit profiles/mutants/ if image attribute is not nil" do 
    assert_not_nil @mutant.image_in_asset
    assert_kind_of String, @mutant.image_in_asset
    assert_equal "profiles/mutants/", @mutant.image_in_asset.to_s[0,17]
  end  
  
  test "is professor xavier should work as is" do
    assert_not @mutant.is_professor_xavier 
    assert mutants(:professorX).is_professor_xavier
  end
  
  test "unlink from team should unlink the mutant from the team" do
    team = teams(:xmen)
    @mutant.unlink_from_team(team.id) 
    assert_equal @mutant.teams.count, 0
    assert_equal team.mutants.count, 1
    assert_not_includes @mutant.teams, team
  end
    
  test "unlink from team should unlink the mutant from the tasks on that team" do
    team = teams(:xmen)
    @mutant.unlink_from_team(team.id) 
    assert_equal @mutant.tasks.count, 0
  end
  
  
end
