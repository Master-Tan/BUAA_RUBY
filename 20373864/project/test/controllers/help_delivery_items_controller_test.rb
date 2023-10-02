require "test_helper"

class HelpDeliveryItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @help_delivery_item = help_delivery_items(:one)
  end

  test "should get index" do
    get help_delivery_items_url
    assert_response :success
  end

  test "should get new" do
    get new_help_delivery_item_url
    assert_response :success
  end

  test "should create help_delivery_item" do
    assert_difference("HelpDeliveryItem.count") do
      post help_delivery_items_url, params: { help_delivery_item: { detail: @help_delivery_item.detail, help_delivery_order_id: @help_delivery_item.help_delivery_order_id, user_id: @help_delivery_item.user_id } }
    end

    assert_redirected_to help_delivery_item_url(HelpDeliveryItem.last)
  end

  test "should show help_delivery_item" do
    get help_delivery_item_url(@help_delivery_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_help_delivery_item_url(@help_delivery_item)
    assert_response :success
  end

  test "should update help_delivery_item" do
    patch help_delivery_item_url(@help_delivery_item), params: { help_delivery_item: { detail: @help_delivery_item.detail, help_delivery_order_id: @help_delivery_item.help_delivery_order_id, user_id: @help_delivery_item.user_id } }
    assert_redirected_to help_delivery_item_url(@help_delivery_item)
  end

  test "should destroy help_delivery_item" do
    assert_difference("HelpDeliveryItem.count", -1) do
      delete help_delivery_item_url(@help_delivery_item)
    end

    assert_redirected_to help_delivery_items_url
  end
end
