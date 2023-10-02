require "test_helper"

class DeliveryOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delivery_order = delivery_orders(:one)
  end

  test "should get index" do
    get delivery_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_delivery_order_url
    assert_response :success
  end

  test "should create delivery_order" do
    assert_difference("DeliveryOrder.count") do
      post delivery_orders_url, params: { delivery_order: { added_time: @delivery_order.added_time, arrival_time: @delivery_order.arrival_time, deliver_id: @delivery_order.deliver_id, transaction_order_id: @delivery_order.transaction_order_id } }
    end

    assert_redirected_to delivery_order_url(DeliveryOrder.last)
  end

  test "should show delivery_order" do
    get delivery_order_url(@delivery_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_delivery_order_url(@delivery_order)
    assert_response :success
  end

  test "should update delivery_order" do
    patch delivery_order_url(@delivery_order), params: { delivery_order: { added_time: @delivery_order.added_time, arrival_time: @delivery_order.arrival_time, deliver_id: @delivery_order.deliver_id, transaction_order_id: @delivery_order.transaction_order_id } }
    assert_redirected_to delivery_order_url(@delivery_order)
  end

  test "should destroy delivery_order" do
    assert_difference("DeliveryOrder.count", -1) do
      delete delivery_order_url(@delivery_order)
    end

    assert_redirected_to delivery_orders_url
  end
end
