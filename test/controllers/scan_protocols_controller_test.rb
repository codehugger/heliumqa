require 'test_helper'

class ScanProtocolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scan_protocol = scan_protocols(:one)
  end

  test "should get index" do
    get scan_protocols_url
    assert_response :success
  end

  test "should get new" do
    get new_scan_protocol_url
    assert_response :success
  end

  test "should create scan_protocol" do
    assert_difference('ScanProtocol.count') do
      post scan_protocols_url, params: { scan_protocol: {
        name: @scan_protocol.name,
        profile_data: @scan_protocol.profile_data,
        site_id: @scan_protocol.site_id } }
    end

    assert_redirected_to scan_protocol_url(ScanProtocol.last)
  end

  test "should show scan_protocol" do
    get scan_protocol_url(@scan_protocol)
    assert_response :success
  end

  test "should get edit" do
    get edit_scan_protocol_url(@scan_protocol)
    assert_response :success
  end

  test "should update scan_protocol" do
    patch scan_protocol_url(@scan_protocol), params: { scan_protocol: {
      name: @scan_protocol.name,
      profile_data: @scan_protocol.profile_data,
      site_id: @scan_protocol.site_id } }
    assert_redirected_to scan_protocol_url(@scan_protocol)
  end

  test "should destroy scan_protocol" do
    assert_difference('ScanProtocol.count', -1) do
      delete scan_protocol_url(@scan_protocol)
    end

    assert_redirected_to scan_protocols_url
  end
end
