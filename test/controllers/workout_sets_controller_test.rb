require "test_helper"

class WorkoutSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workout_set = workout_sets(:one)
  end

  test "should get index" do
    get workout_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_workout_set_url
    assert_response :success
  end

  test "should create workout_set" do
    assert_difference("WorkoutSet.count") do
      post workout_sets_url, params: { workout_set: { exercise_id: @workout_set.exercise_id, lift_id: @workout_set.lift_id, pause_id: @workout_set.pause_id, repetition_id: @workout_set.repetition_id, tempo_id: @workout_set.tempo_id, workout_id: @workout_set.workout_id } }
    end

    assert_redirected_to workout_set_url(WorkoutSet.last)
  end

  test "should show workout_set" do
    get workout_set_url(@workout_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_workout_set_url(@workout_set)
    assert_response :success
  end

  test "should update workout_set" do
    patch workout_set_url(@workout_set), params: { workout_set: { exercise_id: @workout_set.exercise_id, lift_id: @workout_set.lift_id, pause_id: @workout_set.pause_id, repetition_id: @workout_set.repetition_id, tempo_id: @workout_set.tempo_id, workout_id: @workout_set.workout_id } }
    assert_redirected_to workout_set_url(@workout_set)
  end

  test "should destroy workout_set" do
    assert_difference("WorkoutSet.count", -1) do
      delete workout_set_url(@workout_set)
    end

    assert_redirected_to workout_sets_url
  end
end
