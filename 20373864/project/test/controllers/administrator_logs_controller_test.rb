require "test_helper"

class AdministratorLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @administrator_log = administrator_logs(:one)
  end

  test "should get index" do
    get administrator_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_administrator_log_url
    assert_response :success
  end

  test "should create administrator_log" do
    assert_difference("AdministratorLog.count") do
      post administrator_logs_url, params: { administrator_log: { action: @administrator_log.action, add_time: @administrator_log.add_time, administrator_id: @administrator_log.administrator_id, detail: @administrator_log.detail, status: @administrator_log.status } }
    end

    assert_redirected_to administrator_log_url(AdministratorLog.last)
  end

  test "should show administrator_log" do
    get administrator_log_url(@administrator_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_administrator_log_url(@administrator_log)
    assert_response :success
  end

  test "should update administrator_log" do
    patch administrator_log_url(@administrator_log), params: { administrator_log: { action: @administrator_log.action, add_time: @administrator_log.add_time, administrator_id: @administrator_log.administrator_id, detail: @administrator_log.detail, status: @administrator_log.status } }
    assert_redirected_to administrator_log_url(@administrator_log)
  end

  test "should destroy administrator_log" do
    assert_difference("AdministratorLog.count", -1) do
      delete administrator_log_url(@administrator_log)
    end

    assert_redirected_to administrator_logs_url
  end
end
