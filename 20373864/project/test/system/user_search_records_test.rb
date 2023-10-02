require "application_system_test_case"

class UserSearchRecordsTest < ApplicationSystemTestCase
  setup do
    @user_search_record = user_search_records(:one)
  end

  test "visiting the index" do
    visit user_search_records_url
    assert_selector "h1", text: "User search records"
  end

  test "should create user search record" do
    visit user_search_records_url
    click_on "New user search record"

    fill_in "Add time", with: @user_search_record.add_time
    fill_in "Content", with: @user_search_record.content
    fill_in "User", with: @user_search_record.user_id
    click_on "Create User search record"

    assert_text "User search record was successfully created"
    click_on "Back"
  end

  test "should update User search record" do
    visit user_search_record_url(@user_search_record)
    click_on "Edit this user search record", match: :first

    fill_in "Add time", with: @user_search_record.add_time
    fill_in "Content", with: @user_search_record.content
    fill_in "User", with: @user_search_record.user_id
    click_on "Update User search record"

    assert_text "User search record was successfully updated"
    click_on "Back"
  end

  test "should destroy User search record" do
    visit user_search_record_url(@user_search_record)
    click_on "Destroy this user search record", match: :first

    assert_text "User search record was successfully destroyed"
  end
end
