require "test_helper"

class AsbSittingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asb_sitting = asb_sittings(:one)
  end

  test "should get index" do
    get asb_sittings_url, as: :json
    assert_response :success
  end

  test "should create asb_sitting" do
    assert_difference("AsbSitting.count") do
      post asb_sittings_url, params: { asb_sitting: { current_section: @asb_sitting.current_section, user_id: @asb_sitting.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show asb_sitting" do
    get asb_sitting_url(@asb_sitting), as: :json
    assert_response :success
  end

  test "should update asb_sitting" do
    patch asb_sitting_url(@asb_sitting), params: { asb_sitting: { current_section: @asb_sitting.current_section, user_id: @asb_sitting.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy asb_sitting" do
    assert_difference("AsbSitting.count", -1) do
      delete asb_sitting_url(@asb_sitting), as: :json
    end

    assert_response :no_content
  end
end
