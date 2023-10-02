require "test_helper"

class DeliverLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deliver_log = deliver_logs(:one)
  end

  test "should get index" do
    get deliver_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_deliver_log_url
    assert_response :success
  end

  test "should create deliver_log" do
    assert_difference("DeliverLog.count") do
      post deliver_logs_url, params: { deliver_log: { action: @deliver_log.action, add_time: @deliver_log.add_time, deliver_id: @deliver_log.deliver_id, detail: @deliver_log.detail, status: @deliver_log.status } }
    end

    assert_redirected_to deliver_log_url(DeliverLog.last)
  end

  test "should show deliver_log" do
    get deliver_log_url(@deliver_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_deliver_log_url(@deliver_log)
    assert_response :success
  end

  test "should update deliver_log" do
    patch deliver_log_url(@deliver_log), params: { deliver_log: { action: @deliver_log.action, add_time: @deliver_log.add_time, deliver_id: @deliver_log.deliver_id, detail: @deliver_log.detail, status: @deliver_log.status } }
    assert_redirected_to deliver_log_url(@deliver_log)
  end

  test "should destroy deliver_log" do
    assert_difference("DeliverLog.count", -1) do
      delete deliver_log_url(@deliver_log)
    end

    assert_redirected_to deliver_logs_url
  end
end
