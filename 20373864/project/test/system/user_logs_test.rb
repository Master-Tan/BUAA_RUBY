require "application_system_test_case"

class UserLogsTest < ApplicationSystemTestCase
  setup do
    @user_log = user_logs(:one)
  end

  test "visiting the index" do
    visit user_logs_url
    assert_selector "h1", text: "User logs"
  end

  test "should create user log" do
    visit user_logs_url
    click_on "New user log"

    fill_in "Action", with: @user_log.action
    fill_in "Add time", with: @user_log.add_time
    fill_in "Detail", with: @user_log.detail
    fill_in "Status", with: @user_log.status
    fill_in "User", with: @user_log.user_id
    click_on "Create User log"

    assert_text "User log was successfully created"
    click_on "Back"
  end

  test "should update User log" do
    visit user_log_url(@user_log)
    click_on "Edit this user log", match: :first

    fill_in "Action", with: @user_log.action
    fill_in "Add time", with: @user_log.add_time
    fill_in "Detail", with: @user_log.detail
    fill_in "Status", with: @user_log.status
    fill_in "User", with: @user_log.user_id
    click_on "Update User log"

    assert_text "User log was successfully updated"
    click_on "Back"
  end

  test "should destroy User log" do
    visit user_log_url(@user_log)
    click_on "Destroy this user log", match: :first

    assert_text "User log was successfully destroyed"
  end
end
