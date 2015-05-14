require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  def setup
    @user = users(:xavier) # Using a valid fixture
    @user.password = 'a' * 9
    @user.password_confirmation = @user.password
  end
  
  def teardown
    @user = nil
  end
  
  test "setup fixture is valid" do
    assert @user.valid?   
  end
  
  # Name property tests
  
  test "should be invalid if name is missing" do
     @user.name = nil
     assert @user.invalid?   
  end
  
  test 'should be invalid if name exceeds max length' do
    @user.name = 'a' * 51
    assert  @user.invalid?
  end

  # Email property tests
 
  
  test "should be invalid if email is missing" do
     @user.email = nil
     assert @user.invalid?   
  end
   
  test 'should be invalid if email exceeds max length' do
    @user.email = 'a' * 256
    assert  @user.invalid?
  end

  test 'should be invalid if email is not unique ignoring case sensitivity' do
    identical = @user.dup
    assert identical.invalid?, "Email not unique using same case"
    
    identical_with_email_uppercase = @user.dup
    identical_with_email_uppercase.email.upcase!
    assert identical_with_email_uppercase.invalid?, "Email not unique using different case"
  end
  
  test "should be invalid if email doesn't match the validation regexp" do
    assert_match VALID_EMAIL_REGEX, @user.email
    @user.email = "not a valid email"
    assert_no_match VALID_EMAIL_REGEX, @user.email
    assert @user.invalid?
  end
  
  # Password property tests
    
  test 'should be invalid if password is too short' do
    @user.password = 'a' * 5
    @user.password_confirmation = @user.password
    assert  @user.invalid?
  end  
    
  test 'should be invalid if password is too long' do
    @user.password = 'a' * 73
    @user.password_confirmation = @user.password
    assert  @user.invalid?
  end  
  
  test "should be invalid if password and password_confirmation doesn't match" do
    @user.password = 'b' * 9
    assert  @user.invalid?
  end
  
end
