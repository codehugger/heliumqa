require 'test_helper'

class AnalysisRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @analysis_request = analysis_requests(:one)
  end

  test "should get index" do
    get analysis_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_analysis_request_url
    assert_response :success
  end

  test "should create analysis_request" do
    assert_difference('AnalysisRequest.count') do
      post analysis_requests_url, params: { analysis_request: { analysis_id: @analysis_request.analysis_id, equipment_profile_id: @analysis_request.equipment_profile_id } }
    end

    assert_redirected_to analysis_request_url(AnalysisRequest.last)
  end

  test "should show analysis_request" do
    get analysis_request_url(@analysis_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_analysis_request_url(@analysis_request)
    assert_response :success
  end

  test "should update analysis_request" do
    patch analysis_request_url(@analysis_request), params: { analysis_request: { analysis_id: @analysis_request.analysis_id, equipment_profile_id: @analysis_request.equipment_profile_id } }
    assert_redirected_to analysis_request_url(@analysis_request)
  end

  test "should destroy analysis_request" do
    assert_difference('AnalysisRequest.count', -1) do
      delete analysis_request_url(@analysis_request)
    end

    assert_redirected_to analysis_requests_url
  end
end
