require "application_system_test_case"

class HelpDeliveryOrderPlatformsTest < ApplicationSystemTestCase
  setup do
    @help_delivery_order_platform = help_delivery_order_platforms(:one)
  end

  test "visiting the index" do
    visit help_delivery_order_platforms_url
    assert_selector "h1", text: "Help delivery order platforms"
  end

  test "should create help delivery order platform" do
    visit help_delivery_order_platforms_url
    click_on "New help delivery order platform"

    fill_in "Add time", with: @help_delivery_order_platform.add_time
    fill_in "Detail", with: @help_delivery_order_platform.detail
    fill_in "Help delivery order", with: @help_delivery_order_platform.help_delivery_order_id
    fill_in "Image directory", with: @help_delivery_order_platform.image_directory
    click_on "Create Help delivery order platform"

    assert_text "Help delivery order platform was successfully created"
    click_on "Back"
  end

  test "should update Help delivery order platform" do
    visit help_delivery_order_platform_url(@help_delivery_order_platform)
    click_on "Edit this help delivery order platform", match: :first

    fill_in "Add time", with: @help_delivery_order_platform.add_time
    fill_in "Detail", with: @help_delivery_order_platform.detail
    fill_in "Help delivery order", with: @help_delivery_order_platform.help_delivery_order_id
    fill_in "Image directory", with: @help_delivery_order_platform.image_directory
    click_on "Update Help delivery order platform"

    assert_text "Help delivery order platform was successfully updated"
    click_on "Back"
  end

  test "should destroy Help delivery order platform" do
    visit help_delivery_order_platform_url(@help_delivery_order_platform)
    click_on "Destroy this help delivery order platform", match: :first

    assert_text "Help delivery order platform was successfully destroyed"
  end
end
