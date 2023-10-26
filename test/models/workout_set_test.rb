require 'test_helper'

class WorkoutSetTest < ActiveSupport::TestCase
  def setup
    @workout = Workout.create!(title: 'Test Workout', notes: 'Test notes')  # Create a Workout record
    @exercise = Exercise.create!(title: 'Test Exercise', notes: 'Test notes') # Create an Exercise record
    @workout_set = WorkoutSet.create(workout: @workout, exercise: @exercise) # Associate them with WorkoutSet
  end

  # Test associations
  test 'should belong to workout' do
    assert_respond_to @workout_set, :workout
    assert_kind_of Workout, @workout_set.build_workout
  end

  test 'should belong to exercise' do
    assert_respond_to @workout_set, :exercise
    assert_kind_of Exercise, @workout_set.build_exercise
  end

  # Test validations for repetition, tempo, and pause
  test 'should validate numericality of repetition, tempo, and pause' do
    @workout_set.repetition = 'abc'
    @workout_set.tempo = 'def'
    @workout_set.pause = 'ghi'
    @workout_set.series = 'A'
    assert_not @workout_set.valid?

    @workout_set.repetition = 10
    @workout_set.tempo = 5
    @workout_set.pause = 2
    assert @workout_set.valid?, @workout_set.errors.full_messages.join(', ')
  end

  # Test validations for series
  test 'should validate presence of series' do
    @workout_set.series = nil
    assert_not @workout_set.valid?

    @workout_set.series = 'A'
    if @workout_set.valid?
      puts "WorkoutSet errors: #{@workout_set.errors.full_messages}" # Debugging line
      assert false  # This will fail the test and allow you to see the printed errors
    else
      assert_not @workout_set.valid?
    end
  end
end
