require "test_helper"

class BlockedDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blocked_date = blocked_dates(:one)
  end

  test "should get index" do
    get blocked_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_blocked_date_url
    assert_response :success
  end

  test "should create blocked_date" do
    assert_difference('BlockedDate.count') do
      post blocked_dates_url, params: { blocked_date: {  } }
    end

    assert_redirected_to blocked_date_url(BlockedDate.last)
  end

  test "should show blocked_date" do
    get blocked_date_url(@blocked_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_blocked_date_url(@blocked_date)
    assert_response :success
  end

  test "should update blocked_date" do
    patch blocked_date_url(@blocked_date), params: { blocked_date: {  } }
    assert_redirected_to blocked_date_url(@blocked_date)
  end

  test "should destroy blocked_date" do
    assert_difference('BlockedDate.count', -1) do
      delete blocked_date_url(@blocked_date)
    end

    assert_redirected_to blocked_dates_url
  end
end
