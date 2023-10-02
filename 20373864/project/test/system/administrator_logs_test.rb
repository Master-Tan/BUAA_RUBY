require "application_system_test_case"

class AdministratorLogsTest < ApplicationSystemTestCase
  setup do
    @administrator_log = administrator_logs(:one)
  end

  test "visiting the index" do
    visit administrator_logs_url
    assert_selector "h1", text: "Administrator logs"
  end

  test "should create administrator log" do
    visit administrator_logs_url
    click_on "New administrator log"

    fill_in "Action", with: @administrator_log.action
    fill_in "Add time", with: @administrator_log.add_time
    fill_in "Administrator", with: @administrator_log.administrator_id
    fill_in "Detail", with: @administrator_log.detail
    fill_in "Status", with: @administrator_log.status
    click_on "Create Administrator log"

    assert_text "Administrator log was successfully created"
    click_on "Back"
  end

  test "should update Administrator log" do
    visit administrator_log_url(@administrator_log)
    click_on "Edit this administrator log", match: :first

    fill_in "Action", with: @administrator_log.action
    fill_in "Add time", with: @administrator_log.add_time
    fill_in "Administrator", with: @administrator_log.administrator_id
    fill_in "Detail", with: @administrator_log.detail
    fill_in "Status", with: @administrator_log.status
    click_on "Update Administrator log"

    assert_text "Administrator log was successfully updated"
    click_on "Back"
  end

  test "should destroy Administrator log" do
    visit administrator_log_url(@administrator_log)
    click_on "Destroy this administrator log", match: :first

    assert_text "Administrator log was successfully destroyed"
  end
end
