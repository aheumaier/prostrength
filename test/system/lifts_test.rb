require "application_system_test_case"

class LiftsTest < ApplicationSystemTestCase
  setup do
    @lift = lifts(:one)
  end

  test "visiting the index" do
    visit lifts_url
    assert_selector "h1", text: "Lifts"
  end

  test "should create lift" do
    visit lifts_url
    click_on "New lift"

    fill_in "Weight", with: @lift.weight
    click_on "Create Lift"

    assert_text "Lift was successfully created"
    click_on "Back"
  end

  test "should update Lift" do
    visit lift_url(@lift)
    click_on "Edit this lift", match: :first

    fill_in "Weight", with: @lift.weight
    click_on "Update Lift"

    assert_text "Lift was successfully updated"
    click_on "Back"
  end

  test "should destroy Lift" do
    visit lift_url(@lift)
    click_on "Destroy this lift", match: :first

    assert_text "Lift was successfully destroyed"
  end
end
