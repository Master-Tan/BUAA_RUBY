require "test_helper"

class DeliveryAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delivery_address = delivery_addresses(:one)
  end

  test "should get index" do
    get delivery_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_delivery_address_url
    assert_response :success
  end

  test "should create delivery_address" do
    assert_difference("DeliveryAddress.count") do
      post delivery_addresses_url, params: { delivery_address: { building: @delivery_address.building, complete_address: @delivery_address.complete_address, default: @delivery_address.default, floor: @delivery_address.floor, phone: @delivery_address.phone, tag: @delivery_address.tag, user_id: @delivery_address.user_id } }
    end

    assert_redirected_to delivery_address_url(DeliveryAddress.last)
  end

  test "should show delivery_address" do
    get delivery_address_url(@delivery_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_delivery_address_url(@delivery_address)
    assert_response :success
  end

  test "should update delivery_address" do
    patch delivery_address_url(@delivery_address), params: { delivery_address: { building: @delivery_address.building, complete_address: @delivery_address.complete_address, default: @delivery_address.default, floor: @delivery_address.floor, phone: @delivery_address.phone, tag: @delivery_address.tag, user_id: @delivery_address.user_id } }
    assert_redirected_to delivery_address_url(@delivery_address)
  end

  test "should destroy delivery_address" do
    assert_difference("DeliveryAddress.count", -1) do
      delete delivery_address_url(@delivery_address)
    end

    assert_redirected_to delivery_addresses_url
  end
end
