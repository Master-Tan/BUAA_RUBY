require "test_helper"

class DeliversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deliver = delivers(:one)
  end

  test "should get index" do
    get delivers_url
    assert_response :success
  end

  test "should get new" do
    get new_deliver_url
    assert_response :success
  end

  test "should create deliver" do
    assert_difference("Deliver.count") do
      post delivers_url, params: { deliver: { password: @deliver.password, phone: @deliver.phone, username: @deliver.username } }
    end

    assert_redirected_to deliver_url(Deliver.last)
  end

  test "should show deliver" do
    get deliver_url(@deliver)
    assert_response :success
  end

  test "should get edit" do
    get edit_deliver_url(@deliver)
    assert_response :success
  end

  test "should update deliver" do
    patch deliver_url(@deliver), params: { deliver: { password: @deliver.password, phone: @deliver.phone, username: @deliver.username } }
    assert_redirected_to deliver_url(@deliver)
  end

  test "should destroy deliver" do
    assert_difference("Deliver.count", -1) do
      delete deliver_url(@deliver)
    end

    assert_redirected_to delivers_url
  end
end
