require "application_system_test_case"

class DeliveryOrdersTest < ApplicationSystemTestCase
  setup do
    @delivery_order = delivery_orders(:one)
  end

  test "visiting the index" do
    visit delivery_orders_url
    assert_selector "h1", text: "Delivery orders"
  end

  test "should create delivery order" do
    visit delivery_orders_url
    click_on "New delivery order"

    fill_in "Added time", with: @delivery_order.added_time
    fill_in "Arrival time", with: @delivery_order.arrival_time
    fill_in "Deliver", with: @delivery_order.deliver_id
    fill_in "Transaction order", with: @delivery_order.transaction_order_id
    click_on "Create Delivery order"

    assert_text "Delivery order was successfully created"
    click_on "Back"
  end

  test "should update Delivery order" do
    visit delivery_order_url(@delivery_order)
    click_on "Edit this delivery order", match: :first

    fill_in "Added time", with: @delivery_order.added_time
    fill_in "Arrival time", with: @delivery_order.arrival_time
    fill_in "Deliver", with: @delivery_order.deliver_id
    fill_in "Transaction order", with: @delivery_order.transaction_order_id
    click_on "Update Delivery order"

    assert_text "Delivery order was successfully updated"
    click_on "Back"
  end

  test "should destroy Delivery order" do
    visit delivery_order_url(@delivery_order)
    click_on "Destroy this delivery order", match: :first

    assert_text "Delivery order was successfully destroyed"
  end
end
