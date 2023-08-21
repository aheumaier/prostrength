require "test_helper"

class RepetitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repetition = repetitions(:one)
  end

  test "should get index" do
    get repetitions_url
    assert_response :success
  end

  test "should get new" do
    get new_repetition_url
    assert_response :success
  end

  test "should create repetition" do
    assert_difference("Repetition.count") do
      post repetitions_url, params: { repetition: { count: @repetition.count } }
    end

    assert_redirected_to repetition_url(Repetition.last)
  end

  test "should show repetition" do
    get repetition_url(@repetition)
    assert_response :success
  end

  test "should get edit" do
    get edit_repetition_url(@repetition)
    assert_response :success
  end

  test "should update repetition" do
    patch repetition_url(@repetition), params: { repetition: { count: @repetition.count } }
    assert_redirected_to repetition_url(@repetition)
  end

  test "should destroy repetition" do
    assert_difference("Repetition.count", -1) do
      delete repetition_url(@repetition)
    end

    assert_redirected_to repetitions_url
  end
end
