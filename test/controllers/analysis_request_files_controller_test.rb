require 'test_helper'

class AnalysisRequestFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @analysis_request_file = analysis_request_files(:one)
  end

  test "should get index" do
    get analysis_request_files_url
    assert_response :success
  end

  test "should get new" do
    get new_analysis_request_file_url
    assert_response :success
  end

  test "should create analysis_request_file" do
    assert_difference('AnalysisRequestFile.count') do
      post analysis_request_files_url, params: { analysis_request_file: { analysis_request_id: @analysis_request_file.analysis_request_id, inspection_file_id: @analysis_request_file.inspection_file_id } }
    end

    assert_redirected_to analysis_request_file_url(AnalysisRequestFile.last)
  end

  test "should show analysis_request_file" do
    get analysis_request_file_url(@analysis_request_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_analysis_request_file_url(@analysis_request_file)
    assert_response :success
  end

  test "should update analysis_request_file" do
    patch analysis_request_file_url(@analysis_request_file), params: { analysis_request_file: { analysis_request_id: @analysis_request_file.analysis_request_id, inspection_file_id: @analysis_request_file.inspection_file_id } }
    assert_redirected_to analysis_request_file_url(@analysis_request_file)
  end

  test "should destroy analysis_request_file" do
    assert_difference('AnalysisRequestFile.count', -1) do
      delete analysis_request_file_url(@analysis_request_file)
    end

    assert_redirected_to analysis_request_files_url
  end
end
