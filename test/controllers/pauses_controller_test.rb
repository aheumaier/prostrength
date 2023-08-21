require "test_helper"

class PausesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pause = pauses(:one)
  end

  test "should get index" do
    get pauses_url
    assert_response :success
  end

  test "should get new" do
    get new_pause_url
    assert_response :success
  end

  test "should create pause" do
    assert_difference("Pause.count") do
      post pauses_url, params: { pause: { length: @pause.length } }
    end

    assert_redirected_to pause_url(Pause.last)
  end

  test "should show pause" do
    get pause_url(@pause)
    assert_response :success
  end

  test "should get edit" do
    get edit_pause_url(@pause)
    assert_response :success
  end

  test "should update pause" do
    patch pause_url(@pause), params: { pause: { length: @pause.length } }
    assert_redirected_to pause_url(@pause)
  end

  test "should destroy pause" do
    assert_difference("Pause.count", -1) do
      delete pause_url(@pause)
    end

    assert_redirected_to pauses_url
  end
end
