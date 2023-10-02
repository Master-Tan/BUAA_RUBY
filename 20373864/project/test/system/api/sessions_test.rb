require "application_system_test_case"

class Api::SessionsTest < ApplicationSystemTestCase
  setup do
    @api_session = api_sessions(:one)
  end

  test "visiting the index" do
    visit api_sessions_url
    assert_selector "h1", text: "Sessions"
  end

  test "should create session" do
    visit api_sessions_url
    click_on "New session"

    click_on "Create Session"

    assert_text "Session was successfully created"
    click_on "Back"
  end

  test "should update Session" do
    visit api_session_url(@api_session)
    click_on "Edit this session", match: :first

    click_on "Update Session"

    assert_text "Session was successfully updated"
    click_on "Back"
  end

  test "should destroy Session" do
    visit api_session_url(@api_session)
    click_on "Destroy this session", match: :first

    assert_text "Session was successfully destroyed"
  end
end
