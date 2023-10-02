require "application_system_test_case"

class DeliverLogsTest < ApplicationSystemTestCase
  setup do
    @deliver_log = deliver_logs(:one)
  end

  test "visiting the index" do
    visit deliver_logs_url
    assert_selector "h1", text: "Deliver logs"
  end

  test "should create deliver log" do
    visit deliver_logs_url
    click_on "New deliver log"

    fill_in "Action", with: @deliver_log.action
    fill_in "Add time", with: @deliver_log.add_time
    fill_in "Deliver", with: @deliver_log.deliver_id
    fill_in "Detail", with: @deliver_log.detail
    fill_in "Status", with: @deliver_log.status
    click_on "Create Deliver log"

    assert_text "Deliver log was successfully created"
    click_on "Back"
  end

  test "should update Deliver log" do
    visit deliver_log_url(@deliver_log)
    click_on "Edit this deliver log", match: :first

    fill_in "Action", with: @deliver_log.action
    fill_in "Add time", with: @deliver_log.add_time
    fill_in "Deliver", with: @deliver_log.deliver_id
    fill_in "Detail", with: @deliver_log.detail
    fill_in "Status", with: @deliver_log.status
    click_on "Update Deliver log"

    assert_text "Deliver log was successfully updated"
    click_on "Back"
  end

  test "should destroy Deliver log" do
    visit deliver_log_url(@deliver_log)
    click_on "Destroy this deliver log", match: :first

    assert_text "Deliver log was successfully destroyed"
  end
end
