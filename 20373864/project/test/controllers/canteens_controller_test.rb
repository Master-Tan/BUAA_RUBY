require "test_helper"

class CanteensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @canteen = canteens(:one)
  end

  test "should get index" do
    get canteens_url
    assert_response :success
  end

  test "should get new" do
    get new_canteen_url
    assert_response :success
  end

  test "should create canteen" do
    assert_difference("Canteen.count") do
      post canteens_url, params: { canteen: { canteen_name: @canteen.canteen_name } }
    end

    assert_redirected_to canteen_url(Canteen.last)
  end

  test "should show canteen" do
    get canteen_url(@canteen)
    assert_response :success
  end

  test "should get edit" do
    get edit_canteen_url(@canteen)
    assert_response :success
  end

  test "should update canteen" do
    patch canteen_url(@canteen), params: { canteen: { canteen_name: @canteen.canteen_name } }
    assert_redirected_to canteen_url(@canteen)
  end

  test "should destroy canteen" do
    assert_difference("Canteen.count", -1) do
      delete canteen_url(@canteen)
    end

    assert_redirected_to canteens_url
  end
end
