require "application_system_test_case"

class ShopLogsTest < ApplicationSystemTestCase
  setup do
    @shop_log = shop_logs(:one)
  end

  test "visiting the index" do
    visit shop_logs_url
    assert_selector "h1", text: "Shop logs"
  end

  test "should create shop log" do
    visit shop_logs_url
    click_on "New shop log"

    fill_in "Action", with: @shop_log.action
    fill_in "Add time", with: @shop_log.add_time
    fill_in "Detail", with: @shop_log.detail
    fill_in "Shop", with: @shop_log.shop_id
    fill_in "Status", with: @shop_log.status
    click_on "Create Shop log"

    assert_text "Shop log was successfully created"
    click_on "Back"
  end

  test "should update Shop log" do
    visit shop_log_url(@shop_log)
    click_on "Edit this shop log", match: :first

    fill_in "Action", with: @shop_log.action
    fill_in "Add time", with: @shop_log.add_time
    fill_in "Detail", with: @shop_log.detail
    fill_in "Shop", with: @shop_log.shop_id
    fill_in "Status", with: @shop_log.status
    click_on "Update Shop log"

    assert_text "Shop log was successfully updated"
    click_on "Back"
  end

  test "should destroy Shop log" do
    visit shop_log_url(@shop_log)
    click_on "Destroy this shop log", match: :first

    assert_text "Shop log was successfully destroyed"
  end
end
