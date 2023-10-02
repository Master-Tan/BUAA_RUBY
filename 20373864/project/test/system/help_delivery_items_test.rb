require "application_system_test_case"

class HelpDeliveryItemsTest < ApplicationSystemTestCase
  setup do
    @help_delivery_item = help_delivery_items(:one)
  end

  test "visiting the index" do
    visit help_delivery_items_url
    assert_selector "h1", text: "Help delivery items"
  end

  test "should create help delivery item" do
    visit help_delivery_items_url
    click_on "New help delivery item"

    fill_in "Detail", with: @help_delivery_item.detail
    fill_in "Help delivery order", with: @help_delivery_item.help_delivery_order_id
    fill_in "User", with: @help_delivery_item.user_id
    click_on "Create Help delivery item"

    assert_text "Help delivery item was successfully created"
    click_on "Back"
  end

  test "should update Help delivery item" do
    visit help_delivery_item_url(@help_delivery_item)
    click_on "Edit this help delivery item", match: :first

    fill_in "Detail", with: @help_delivery_item.detail
    fill_in "Help delivery order", with: @help_delivery_item.help_delivery_order_id
    fill_in "User", with: @help_delivery_item.user_id
    click_on "Update Help delivery item"

    assert_text "Help delivery item was successfully updated"
    click_on "Back"
  end

  test "should destroy Help delivery item" do
    visit help_delivery_item_url(@help_delivery_item)
    click_on "Destroy this help delivery item", match: :first

    assert_text "Help delivery item was successfully destroyed"
  end
end
