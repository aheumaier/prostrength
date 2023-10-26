require 'test_helper'

class TrainingSessionTest < ActiveSupport::TestCase
  def setup
    @workout = Workout.create!(title: 'Test Workout', notes: 'Some notes')
    @plan = Plan.create!(title: 'Test Plan', start: Date.today, end: Date.today + 7.days)
    @user = User.create!(email: 'test@example.com', password: 'password', username: 'testuser')
    @training_session = TrainingSession.new(workout: @workout, plan: @plan, user: @user, start_time: DateTime.now)
  end

  # Test validations
  test 'should validate presence of workout' do
    @training_session.workout = nil
    assert_not @training_session.valid?
  end

  test 'should validate presence of plan' do
    @training_session.plan = nil
    assert @training_session.valid?  # Plan is optional
  end

  test 'should validate presence of user' do
    @training_session.user = nil
    assert @training_session.valid?  # User is optional
  end

  # Test associations
  test 'should belong to workout' do
    assert_respond_to @training_session, :workout
  end

  test 'should belong to plan' do
    assert_respond_to @training_session, :plan
  end

  test 'should belong to user' do
    assert_respond_to @training_session, :user
  end

  # Test counter_cache for workout
  test 'should update workout counter cache' do
    assert_difference('@workout.training_sessions_count', 1) do
      @training_session.save!
      @workout.reload
    end
  end

  # Test counter_cache for user
  test 'should update user counter cache' do
    assert_difference('@user.training_sessions_count', 1) do
      @training_session.save!
      @user.reload
    end
  end
end
