require "test_helper"

class TemposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tempo = tempos(:one)
  end

  test "should get index" do
    get tempos_url
    assert_response :success
  end

  test "should get new" do
    get new_tempo_url
    assert_response :success
  end

  test "should create tempo" do
    assert_difference("Tempo.count") do
      post tempos_url, params: { tempo: { duration: @tempo.duration } }
    end

    assert_redirected_to tempo_url(Tempo.last)
  end

  test "should show tempo" do
    get tempo_url(@tempo)
    assert_response :success
  end

  test "should get edit" do
    get edit_tempo_url(@tempo)
    assert_response :success
  end

  test "should update tempo" do
    patch tempo_url(@tempo), params: { tempo: { duration: @tempo.duration } }
    assert_redirected_to tempo_url(@tempo)
  end

  test "should destroy tempo" do
    assert_difference("Tempo.count", -1) do
      delete tempo_url(@tempo)
    end

    assert_redirected_to tempos_url
  end
end
