require "application_system_test_case"

class TrainingSessionsTest < ApplicationSystemTestCase
  setup do
    @training_session = training_sessions(:one)
  end

  test "visiting the index" do
    visit training_sessions_url
    assert_selector "h1", text: "Training sessions"
  end

  test "should create training session" do
    visit training_sessions_url
    click_on "New training session"

    fill_in "Plan", with: @training_session.plan_id
    fill_in "Workout", with: @training_session.workout_id
    click_on "Create Training session"

    assert_text "Training session was successfully created"
    click_on "Back"
  end

  test "should update Training session" do
    visit training_session_url(@training_session)
    click_on "Edit this training session", match: :first

    fill_in "Plan", with: @training_session.plan_id
    fill_in "Workout", with: @training_session.workout_id
    click_on "Update Training session"

    assert_text "Training session was successfully updated"
    click_on "Back"
  end

  test "should destroy Training session" do
    visit training_session_url(@training_session)
    click_on "Destroy this training session", match: :first

    assert_text "Training session was successfully destroyed"
  end
end
