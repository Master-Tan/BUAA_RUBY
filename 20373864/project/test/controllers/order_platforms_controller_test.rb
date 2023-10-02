require "test_helper"

class OrderPlatformsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_platform = order_platforms(:one)
  end

  test "should get index" do
    get order_platforms_url
    assert_response :success
  end

  test "should get new" do
    get new_order_platform_url
    assert_response :success
  end

  test "should create order_platform" do
    assert_difference("OrderPlatform.count") do
      post order_platforms_url, params: { order_platform: { add_time: @order_platform.add_time, detail: @order_platform.detail, image_directory: @order_platform.image_directory, transaction_order_id: @order_platform.transaction_order_id } }
    end

    assert_redirected_to order_platform_url(OrderPlatform.last)
  end

  test "should show order_platform" do
    get order_platform_url(@order_platform)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_platform_url(@order_platform)
    assert_response :success
  end

  test "should update order_platform" do
    patch order_platform_url(@order_platform), params: { order_platform: { add_time: @order_platform.add_time, detail: @order_platform.detail, image_directory: @order_platform.image_directory, transaction_order_id: @order_platform.transaction_order_id } }
    assert_redirected_to order_platform_url(@order_platform)
  end

  test "should destroy order_platform" do
    assert_difference("OrderPlatform.count", -1) do
      delete order_platform_url(@order_platform)
    end

    assert_redirected_to order_platforms_url
  end
end
