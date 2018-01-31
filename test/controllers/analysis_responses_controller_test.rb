require 'test_helper'

class AnalysisResponsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @analysis_response = analysis_responses(:one)
  end

  test "should get index" do
    get analysis_responses_url
    assert_response :success
  end

  test "should get new" do
    get new_analysis_response_url
    assert_response :success
  end

  test "should create analysis_response" do
    assert_difference('AnalysisResponse.count') do
      post analysis_responses_url, params: { analysis_response: { analysis_request_id: @analysis_response.analysis_request_id, response_data: @analysis_response.response_data } }
    end

    assert_redirected_to analysis_response_url(AnalysisResponse.last)
  end

  test "should show analysis_response" do
    get analysis_response_url(@analysis_response)
    assert_response :success
  end

  test "should get edit" do
    get edit_analysis_response_url(@analysis_response)
    assert_response :success
  end

  test "should update analysis_response" do
    patch analysis_response_url(@analysis_response), params: { analysis_response: { analysis_request_id: @analysis_response.analysis_request_id, response_data: @analysis_response.response_data } }
    assert_redirected_to analysis_response_url(@analysis_response)
  end

  test "should destroy analysis_response" do
    assert_difference('AnalysisResponse.count', -1) do
      delete analysis_response_url(@analysis_response)
    end

    assert_redirected_to analysis_responses_url
  end
end
