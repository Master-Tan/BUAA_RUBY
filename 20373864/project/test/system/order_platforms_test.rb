require "application_system_test_case"

class OrderPlatformsTest < ApplicationSystemTestCase
  setup do
    @order_platform = order_platforms(:one)
  end

  test "visiting the index" do
    visit order_platforms_url
    assert_selector "h1", text: "Order platforms"
  end

  test "should create order platform" do
    visit order_platforms_url
    click_on "New order platform"

    fill_in "Add time", with: @order_platform.add_time
    fill_in "Detail", with: @order_platform.detail
    fill_in "Image directory", with: @order_platform.image_directory
    fill_in "Transaction order", with: @order_platform.transaction_order_id
    click_on "Create Order platform"

    assert_text "Order platform was successfully created"
    click_on "Back"
  end

  test "should update Order platform" do
    visit order_platform_url(@order_platform)
    click_on "Edit this order platform", match: :first

    fill_in "Add time", with: @order_platform.add_time
    fill_in "Detail", with: @order_platform.detail
    fill_in "Image directory", with: @order_platform.image_directory
    fill_in "Transaction order", with: @order_platform.transaction_order_id
    click_on "Update Order platform"

    assert_text "Order platform was successfully updated"
    click_on "Back"
  end

  test "should destroy Order platform" do
    visit order_platform_url(@order_platform)
    click_on "Destroy this order platform", match: :first

    assert_text "Order platform was successfully destroyed"
  end
end
