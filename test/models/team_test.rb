require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  def setup
    @team = teams(:xmen) # Using a valid fixture
  end
  
  def teardown
    @team = nil
  end
  
  test "setup fixture is valid" do
    assert @team.valid?   
  end
  
  # Properties tests
  
  test "should be invalid if name is missing" do
     @team.name = nil
     assert @team.invalid?   
  end
    
  test "should be invalid if name is not unique ignoring case sensitivity" do
    identical = @team.dup
    assert identical.invalid?, "Name not unique using same case"
    
    identical_with_name_uppercase = @team.dup
    identical_with_name_uppercase.name.upcase!
    assert identical_with_name_uppercase.invalid?, "Name not unique using different case"
  end
  
  # Methods tests
  
  test "image in asset should be nil if image attribute is nil" do 
    @team.image = nil
    assert_nil @team.image_in_asset
  end
  
  test "image in asset should be a string starting whit profiles/teams/ if image attribute is not nil" do 
    assert_not_nil @team.image_in_asset
    assert_kind_of String, @team.image_in_asset
    assert_equal "profiles/teams/", @team.image_in_asset.to_s[0,15]
  end  
  
  test "unlink from mutant should unlink the mutant from the team" do
    mutant = mutants(:wolwerine)
    @team.unlink_from_mutant(mutant.id) 
    assert_equal @team.mutants.count, 1
    assert_not_includes @team.mutants, mutant
  end
    
  test "unlink from mutant should unlink the mutant from the tasks on that team" do
    mutant = mutants(:wolwerine)
    @team.unlink_from_mutant(mutant.id) 
    assert_equal mutant.tasks.count, 0
  end
  
  test "powers of the team are the powers of the mutants assigned" do 
    unique_mutants_powers_of_the_team = @team.mutants.map{ |mutant| mutant.powers }.flatten.uniq
    assert_equal @team.powers, unique_mutants_powers_of_the_team
  end
  
end
