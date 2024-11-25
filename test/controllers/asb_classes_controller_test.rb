require "test_helper"

class AsbClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asb_class = asb_classes(:one)
  end

  test "should get index" do
    get asb_classes_url, as: :json
    assert_response :success
  end

  test "should create asb_class" do
    assert_difference("AsbClass.count") do
      post asb_classes_url, params: { asb_class: { current_section: @asb_class.current_section, user_id: @asb_class.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show asb_class" do
    get asb_class_url(@asb_class), as: :json
    assert_response :success
  end

  test "should update asb_class" do
    patch asb_class_url(@asb_class), params: { asb_class: { current_section: @asb_class.current_section, user_id: @asb_class.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy asb_class" do
    assert_difference("AsbClass.count", -1) do
      delete asb_class_url(@asb_class), as: :json
    end

    assert_response :no_content
  end
end
