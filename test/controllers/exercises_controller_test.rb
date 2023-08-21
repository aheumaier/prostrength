require "test_helper"

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # <-- Include helpers

  setup do
    @exercise = exercises(:one)
  end

  test "should get index" do
    sign_in User.create(:email => 'mail@andreasheumaier.de', :password => 'Test1234', :password_confirmation => 'Test1234')
    get exercises_url
    assert_response :success
  end

  test "should get new" do
    sign_in User.create(:email => 'mail@andreasheumaier.de', :password => 'Test1234', :password_confirmation => 'Test1234')
    get new_exercise_url
    assert_response :success
  end

  test "should create exercise" do
    sign_in User.create(:email => 'mail@andreasheumaier.de', :password => 'Test1234', :password_confirmation => 'Test1234')
    assert_difference("Exercise.count") do
      post exercises_url, params: { exercise: { notes: @exercise.notes, title: @exercise.title } }
    end

    assert_redirected_to exercise_url(Exercise.last)
  end

  test "should show exercise" do
    sign_in User.create(:email => 'mail@andreasheumaier.de', :password => 'Test1234', :password_confirmation => 'Test1234')
    get exercise_url(@exercise)
    assert_response :success
  end

  test "should get edit" do
    sign_in User.create(:email => 'mail@andreasheumaier.de', :password => 'Test1234', :password_confirmation => 'Test1234')
    get edit_exercise_url(@exercise)
    assert_response :success
  end

  test "should update exercise" do
    sign_in User.create(:email => 'mail@andreasheumaier.de', :password => 'Test1234', :password_confirmation => 'Test1234')
    patch exercise_url(@exercise), params: { exercise: { notes: @exercise.notes, title: @exercise.title } }
    assert_redirected_to exercise_url(@exercise)
  end

  test "should destroy exercise" do
    sign_in User.create(:email => 'mail@andreasheumaier.de', :password => 'Test1234', :password_confirmation => 'Test1234')
    assert_difference("Exercise.count", -1) do
      delete exercise_url(@exercise)
    end

    assert_redirected_to exercises_url
  end
end
