require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  def setup
    @exercise = Exercise.create(title: 'Test Exercise', notes: 'Some notes')
  end

  # Test validations for title
  test 'should validate presence of title' do
    @exercise.title = nil
    assert_not @exercise.valid?
    @exercise.title = 'Test Exercise'
    assert @exercise.valid?
  end

  # Test associations
  test 'should have many workout_sets' do
    assert_respond_to @exercise, :workout_sets
  end

  test 'should have many workouts through workout_sets' do
    assert_respond_to @exercise, :workouts
  end
end
