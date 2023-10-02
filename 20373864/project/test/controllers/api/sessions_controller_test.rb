require "test_helper"

class Api::SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_session = api_sessions(:one)
  end

  test "should get index" do
    get api_sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_api_session_url
    assert_response :success
  end

  test "should create api_session" do
    assert_difference("Api::Session.count") do
      post api_sessions_url, params: { api_session: {  } }
    end

    assert_redirected_to api_session_url(Api::Session.last)
  end

  test "should show api_session" do
    get api_session_url(@api_session)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_session_url(@api_session)
    assert_response :success
  end

  test "should update api_session" do
    patch api_session_url(@api_session), params: { api_session: {  } }
    assert_redirected_to api_session_url(@api_session)
  end

  test "should destroy api_session" do
    assert_difference("Api::Session.count", -1) do
      delete api_session_url(@api_session)
    end

    assert_redirected_to api_sessions_url
  end
end
