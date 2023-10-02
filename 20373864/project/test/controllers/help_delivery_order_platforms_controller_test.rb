require "test_helper"

class HelpDeliveryOrderPlatformsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @help_delivery_order_platform = help_delivery_order_platforms(:one)
  end

  test "should get index" do
    get help_delivery_order_platforms_url
    assert_response :success
  end

  test "should get new" do
    get new_help_delivery_order_platform_url
    assert_response :success
  end

  test "should create help_delivery_order_platform" do
    assert_difference("HelpDeliveryOrderPlatform.count") do
      post help_delivery_order_platforms_url, params: { help_delivery_order_platform: { add_time: @help_delivery_order_platform.add_time, detail: @help_delivery_order_platform.detail, help_delivery_order_id: @help_delivery_order_platform.help_delivery_order_id, image_directory: @help_delivery_order_platform.image_directory } }
    end

    assert_redirected_to help_delivery_order_platform_url(HelpDeliveryOrderPlatform.last)
  end

  test "should show help_delivery_order_platform" do
    get help_delivery_order_platform_url(@help_delivery_order_platform)
    assert_response :success
  end

  test "should get edit" do
    get edit_help_delivery_order_platform_url(@help_delivery_order_platform)
    assert_response :success
  end

  test "should update help_delivery_order_platform" do
    patch help_delivery_order_platform_url(@help_delivery_order_platform), params: { help_delivery_order_platform: { add_time: @help_delivery_order_platform.add_time, detail: @help_delivery_order_platform.detail, help_delivery_order_id: @help_delivery_order_platform.help_delivery_order_id, image_directory: @help_delivery_order_platform.image_directory } }
    assert_redirected_to help_delivery_order_platform_url(@help_delivery_order_platform)
  end

  test "should destroy help_delivery_order_platform" do
    assert_difference("HelpDeliveryOrderPlatform.count", -1) do
      delete help_delivery_order_platform_url(@help_delivery_order_platform)
    end

    assert_redirected_to help_delivery_order_platforms_url
  end
end
