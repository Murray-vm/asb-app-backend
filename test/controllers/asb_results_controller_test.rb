require "test_helper"

class AsbResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asb_result = asb_results(:one)
  end

  test "should get index" do
    get asb_results_url, as: :json
    assert_response :success
  end

  test "should create asb_result" do
    assert_difference("AsbResult.count") do
      post asb_results_url, params: { asb_result: { result: @asb_result.result, session_id: @asb_result.session_id, student_id: @asb_result.student_id, user_id: @asb_result.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show asb_result" do
    get asb_result_url(@asb_result), as: :json
    assert_response :success
  end

  test "should update asb_result" do
    patch asb_result_url(@asb_result), params: { asb_result: { result: @asb_result.result, session_id: @asb_result.session_id, student_id: @asb_result.student_id, user_id: @asb_result.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy asb_result" do
    assert_difference("AsbResult.count", -1) do
      delete asb_result_url(@asb_result), as: :json
    end

    assert_response :no_content
  end
end
