require "application_system_test_case"

class DeliversTest < ApplicationSystemTestCase
  setup do
    @deliver = delivers(:one)
  end

  test "visiting the index" do
    visit delivers_url
    assert_selector "h1", text: "Delivers"
  end

  test "should create deliver" do
    visit delivers_url
    click_on "New deliver"

    fill_in "Password", with: @deliver.password
    fill_in "Phone", with: @deliver.phone
    fill_in "Username", with: @deliver.username
    click_on "Create Deliver"

    assert_text "Deliver was successfully created"
    click_on "Back"
  end

  test "should update Deliver" do
    visit deliver_url(@deliver)
    click_on "Edit this deliver", match: :first

    fill_in "Password", with: @deliver.password
    fill_in "Phone", with: @deliver.phone
    fill_in "Username", with: @deliver.username
    click_on "Update Deliver"

    assert_text "Deliver was successfully updated"
    click_on "Back"
  end

  test "should destroy Deliver" do
    visit deliver_url(@deliver)
    click_on "Destroy this deliver", match: :first

    assert_text "Deliver was successfully destroyed"
  end
end
