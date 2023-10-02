require "test_helper"

class ShopLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop_log = shop_logs(:one)
  end

  test "should get index" do
    get shop_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_shop_log_url
    assert_response :success
  end

  test "should create shop_log" do
    assert_difference("ShopLog.count") do
      post shop_logs_url, params: { shop_log: { action: @shop_log.action, add_time: @shop_log.add_time, detail: @shop_log.detail, shop_id: @shop_log.shop_id, status: @shop_log.status } }
    end

    assert_redirected_to shop_log_url(ShopLog.last)
  end

  test "should show shop_log" do
    get shop_log_url(@shop_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_shop_log_url(@shop_log)
    assert_response :success
  end

  test "should update shop_log" do
    patch shop_log_url(@shop_log), params: { shop_log: { action: @shop_log.action, add_time: @shop_log.add_time, detail: @shop_log.detail, shop_id: @shop_log.shop_id, status: @shop_log.status } }
    assert_redirected_to shop_log_url(@shop_log)
  end

  test "should destroy shop_log" do
    assert_difference("ShopLog.count", -1) do
      delete shop_log_url(@shop_log)
    end

    assert_redirected_to shop_logs_url
  end
end
