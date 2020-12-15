require 'test_helper'

class HistoricalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historical = historicals(:one)
  end

  test "should get index" do
    get historicals_url
    assert_response :success
  end

  test "should get new" do
    get new_historical_url
    assert_response :success
  end

  test "should create historical" do
    assert_difference('Historical.count') do
      post historicals_url, params: { historical: { content: @historical.content, title: @historical.title } }
    end

    assert_redirected_to historical_url(Historical.last)
  end

  test "should show historical" do
    get historical_url(@historical)
    assert_response :success
  end

  test "should get edit" do
    get edit_historical_url(@historical)
    assert_response :success
  end

  test "should update historical" do
    patch historical_url(@historical), params: { historical: { content: @historical.content, title: @historical.title } }
    assert_redirected_to historical_url(@historical)
  end

  test "should destroy historical" do
    assert_difference('Historical.count', -1) do
      delete historical_url(@historical)
    end

    assert_redirected_to historicals_url
  end
end
