require "test_helper"

class UserSearchRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_search_record = user_search_records(:one)
  end

  test "should get index" do
    get user_search_records_url
    assert_response :success
  end

  test "should get new" do
    get new_user_search_record_url
    assert_response :success
  end

  test "should create user_search_record" do
    assert_difference("UserSearchRecord.count") do
      post user_search_records_url, params: { user_search_record: { add_time: @user_search_record.add_time, content: @user_search_record.content, user_id: @user_search_record.user_id } }
    end

    assert_redirected_to user_search_record_url(UserSearchRecord.last)
  end

  test "should show user_search_record" do
    get user_search_record_url(@user_search_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_search_record_url(@user_search_record)
    assert_response :success
  end

  test "should update user_search_record" do
    patch user_search_record_url(@user_search_record), params: { user_search_record: { add_time: @user_search_record.add_time, content: @user_search_record.content, user_id: @user_search_record.user_id } }
    assert_redirected_to user_search_record_url(@user_search_record)
  end

  test "should destroy user_search_record" do
    assert_difference("UserSearchRecord.count", -1) do
      delete user_search_record_url(@user_search_record)
    end

    assert_redirected_to user_search_records_url
  end
end
