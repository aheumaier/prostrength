require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
  def setup
    @workout = Workout.new
    @exercise1 = Exercise.create!(title: 'Test Exercise1', notes: 'Test notes') # Create an Exercise record
    @exercise2 = Exercise.create!(title: 'Test Exercise2', notes: 'Test notes') # Create an second  Exercise record
    # @workout_set = WorkoutSet.new(workout: @workout, exercise: @exercise) # Associate them with WorkoutSet
    @workout.workout_sets_attributes = [
      {
        exercise_id: @exercise1.id, # Replace with actual Exercise ID
        repetition: 10,
        tempo: 5,
        pause: 2,
        series: 'A',
        grip: 'none'
      },
      {
        exercise_id: @exercise2.id, # Replace with actual Exercise ID
        repetition: 8,
        tempo: 4,
        pause: 1,
        series: 'B',
        grip: 'none'
      }
    ]
  end

  # Test validations for title
  test 'should validate presence of title' do
    @workout.title = nil
    assert_not @workout.valid?
    @workout.title = 'Test Workout'
    assert @workout.valid?
  end

  # Test associations
  test 'should have many workout_sets' do
    assert_respond_to @workout, :workout_sets
    assert_kind_of ActiveRecord::Associations::CollectionProxy, @workout.workout_sets
  end

  test 'should have many exercises through workout_sets' do
    assert_respond_to @workout, :exercises
    assert_kind_of ActiveRecord::Associations::CollectionProxy, @workout.exercises
  end

  test 'should have many training_sessions' do
    assert_respond_to @workout, :training_sessions
    assert_kind_of ActiveRecord::Associations::CollectionProxy, @workout.training_sessions
  end

  test 'should have many plans through training_sessions' do
    assert_respond_to @workout, :plans
    assert_kind_of ActiveRecord::Associations::CollectionProxy, @workout.plans
  end

  # Test nested attributes
  test 'should accept nested attributes for workout_sets' do
    @workout.workout_sets_attributes = [
      {
        exercise_id: @exercise1.id,  # Replace with actual Exercise ID
        repetition: 10,
        tempo: 5,
        pause: 2,
        series: 'A',
        grip: 'none'
      },
      {
        exercise_id: @exercise2.id,  # Replace with actual Exercise ID
        repetition: 8,
        tempo: 4,
        pause: 1,
        series: 'B',
        grip: 'none'
      }
    ]

    assert_equal 4, @workout.workout_sets.size
    assert(@workout.workout_sets.all? { |workout_set| workout_set.valid? })
  end
end
