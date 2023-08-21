require "application_system_test_case"

class PausesTest < ApplicationSystemTestCase
  setup do
    @pause = pauses(:one)
  end

  test "visiting the index" do
    visit pauses_url
    assert_selector "h1", text: "Pauses"
  end

  test "should create pause" do
    visit pauses_url
    click_on "New pause"

    fill_in "Length", with: @pause.length
    click_on "Create Pause"

    assert_text "Pause was successfully created"
    click_on "Back"
  end

  test "should update Pause" do
    visit pause_url(@pause)
    click_on "Edit this pause", match: :first

    fill_in "Length", with: @pause.length
    click_on "Update Pause"

    assert_text "Pause was successfully updated"
    click_on "Back"
  end

  test "should destroy Pause" do
    visit pause_url(@pause)
    click_on "Destroy this pause", match: :first

    assert_text "Pause was successfully destroyed"
  end
end
