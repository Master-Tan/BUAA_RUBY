require "application_system_test_case"

class CanteensTest < ApplicationSystemTestCase
  setup do
    @canteen = canteens(:one)
  end

  test "visiting the index" do
    visit canteens_url
    assert_selector "h1", text: "Canteens"
  end

  test "should create canteen" do
    visit canteens_url
    click_on "New canteen"

    fill_in "Canteen name", with: @canteen.canteen_name
    click_on "Create Canteen"

    assert_text "Canteen was successfully created"
    click_on "Back"
  end

  test "should update Canteen" do
    visit canteen_url(@canteen)
    click_on "Edit this canteen", match: :first

    fill_in "Canteen name", with: @canteen.canteen_name
    click_on "Update Canteen"

    assert_text "Canteen was successfully updated"
    click_on "Back"
  end

  test "should destroy Canteen" do
    visit canteen_url(@canteen)
    click_on "Destroy this canteen", match: :first

    assert_text "Canteen was successfully destroyed"
  end
end
