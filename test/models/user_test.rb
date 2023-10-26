require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'test@example.com', password: 'password', username: 'testuser')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'should have default role as user' do
    assert_equal 'user', @user.role
  end

  test 'should not allow duplicate email' do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'should not allow duplicate username' do
    duplicate_user = @user.dup
    duplicate_user.email = 'new@example.com'
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'should have many training_sessions' do
    assert_respond_to @user, :training_sessions
  end

  test 'should have many plans through training_sessions' do
    assert_respond_to @user, :plans
  end

  test 'should have many customers' do
    assert_respond_to @user, :customers
  end

  test 'should belong to coach' do
    assert_respond_to @user, :coach
  end

  test 'should have one profile' do
    assert_respond_to @user, :profile
  end

  test 'should not require email' do
    assert_equal false, @user.email_required?
  end

  test 'should not have email changed' do
    assert_equal false, @user.email_changed?
  end

  test 'should not save change to email' do
    assert_equal false, @user.will_save_change_to_email?
  end
end
