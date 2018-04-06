require 'test_helper'

class ScanProtocolMatchersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scan_protocol_matcher = scan_protocol_matchers(:one)
  end

  test "should get index" do
    get scan_protocol_matchers_url
    assert_response :success
  end

  test "should get new" do
    get new_scan_protocol_matcher_url
    assert_response :success
  end

  test "should create scan_protocol_matcher" do
    assert_difference('ScanProtocolMatcher.count') do
      post scan_protocol_matchers_url, params: { scan_protocol_matcher: {  } }
    end

    assert_redirected_to scan_protocol_matcher_url(ScanProtocolMatcher.last)
  end

  test "should show scan_protocol_matcher" do
    get scan_protocol_matcher_url(@scan_protocol_matcher)
    assert_response :success
  end

  test "should get edit" do
    get edit_scan_protocol_matcher_url(@scan_protocol_matcher)
    assert_response :success
  end

  test "should update scan_protocol_matcher" do
    patch scan_protocol_matcher_url(@scan_protocol_matcher), params: { scan_protocol_matcher: {  } }
    assert_redirected_to scan_protocol_matcher_url(@scan_protocol_matcher)
  end

  test "should destroy scan_protocol_matcher" do
    assert_difference('ScanProtocolMatcher.count', -1) do
      delete scan_protocol_matcher_url(@scan_protocol_matcher)
    end

    assert_redirected_to scan_protocol_matchers_url
  end
end
