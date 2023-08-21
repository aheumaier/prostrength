require "application_system_test_case"

class RepetitionsTest < ApplicationSystemTestCase
  setup do
    @repetition = repetitions(:one)
  end

  test "visiting the index" do
    visit repetitions_url
    assert_selector "h1", text: "Repetitions"
  end

  test "should create repetition" do
    visit repetitions_url
    click_on "New repetition"

    fill_in "Count", with: @repetition.count
    click_on "Create Repetition"

    assert_text "Repetition was successfully created"
    click_on "Back"
  end

  test "should update Repetition" do
    visit repetition_url(@repetition)
    click_on "Edit this repetition", match: :first

    fill_in "Count", with: @repetition.count
    click_on "Update Repetition"

    assert_text "Repetition was successfully updated"
    click_on "Back"
  end

  test "should destroy Repetition" do
    visit repetition_url(@repetition)
    click_on "Destroy this repetition", match: :first

    assert_text "Repetition was successfully destroyed"
  end
end
