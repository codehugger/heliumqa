require 'test_helper'

class ScanSeriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scan_series = scan_series(:one)
  end

  test "should get index" do
    get scan_series_index_url
    assert_response :success
  end

  test "should get new" do
    get new_scan_series_url
    assert_response :success
  end

  test "should create scan_series" do
    assert_difference('ScanSeries.count') do
      post scan_series_index_url, params: { scan_series: { key: @scan_series.key } }
    end

    assert_redirected_to scan_series_url(ScanSeries.last)
  end

  test "should show scan_series" do
    get scan_series_url(@scan_series)
    assert_response :success
  end

  test "should get edit" do
    get edit_scan_series_url(@scan_series)
    assert_response :success
  end

  test "should update scan_series" do
    patch scan_series_url(@scan_series), params: { scan_series: { key: @scan_series.key } }
    assert_redirected_to scan_series_url(@scan_series)
  end

  test "should destroy scan_series" do
    assert_difference('ScanSeries.count', -1) do
      delete scan_series_url(@scan_series)
    end

    assert_redirected_to scan_series_index_url
  end
end
