require "application_system_test_case"

class TemposTest < ApplicationSystemTestCase
  setup do
    @tempo = tempos(:one)
  end

  test "visiting the index" do
    visit tempos_url
    assert_selector "h1", text: "Tempos"
  end

  test "should create tempo" do
    visit tempos_url
    click_on "New tempo"

    fill_in "Duration", with: @tempo.duration
    click_on "Create Tempo"

    assert_text "Tempo was successfully created"
    click_on "Back"
  end

  test "should update Tempo" do
    visit tempo_url(@tempo)
    click_on "Edit this tempo", match: :first

    fill_in "Duration", with: @tempo.duration
    click_on "Update Tempo"

    assert_text "Tempo was successfully updated"
    click_on "Back"
  end

  test "should destroy Tempo" do
    visit tempo_url(@tempo)
    click_on "Destroy this tempo", match: :first

    assert_text "Tempo was successfully destroyed"
  end
end
