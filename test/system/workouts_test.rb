require 'application_system_test_case'

class WorkoutsTest < ApplicationSystemTestCase
  setup do
    get '/users/sign_in'
    sign_in_as(users(:one))
    @workout = workouts(:one)
  end

  test 'visiting the index' do
    visit workouts_url
    assert_selector 'h1', text: 'Workouts'
  end

  test 'should create workout' do
    visit workouts_url
    click_on 'New workout'

    fill_in 'Notes', with: @workout.notes
    fill_in 'Title', with: @workout.title
    click_on 'Create Workout'

    assert_text 'Workout was successfully created'
    click_on 'Back'
  end

  test 'should update Workout' do
    visit workout_url(@workout)
    click_on 'Edit this workout', match: :first

    fill_in 'Notes', with: @workout.notes
    fill_in 'Title', with: @workout.title
    click_on 'Update Workout'

    assert_text 'Workout was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Workout' do
    visit workout_url(@workout)
    click_on 'Destroy this workout', match: :first

    assert_text 'Workout was successfully destroyed'
  end
end
