require 'test_helper'

class AnalysisResponseFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @analysis_response_file = analysis_response_files(:one)
  end

  test "should get index" do
    get analysis_response_files_url
    assert_response :success
  end

  test "should get new" do
    get new_analysis_response_file_url
    assert_response :success
  end

  test "should create analysis_response_file" do
    assert_difference('AnalysisResponseFile.count') do
      post analysis_response_files_url, params: { analysis_response_file: { analysis_response_id: @analysis_response_file.analysis_response_id, file_data: @analysis_response_file.file_data } }
    end

    assert_redirected_to analysis_response_file_url(AnalysisResponseFile.last)
  end

  test "should show analysis_response_file" do
    get analysis_response_file_url(@analysis_response_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_analysis_response_file_url(@analysis_response_file)
    assert_response :success
  end

  test "should update analysis_response_file" do
    patch analysis_response_file_url(@analysis_response_file), params: { analysis_response_file: { analysis_response_id: @analysis_response_file.analysis_response_id, file_data: @analysis_response_file.file_data } }
    assert_redirected_to analysis_response_file_url(@analysis_response_file)
  end

  test "should destroy analysis_response_file" do
    assert_difference('AnalysisResponseFile.count', -1) do
      delete analysis_response_file_url(@analysis_response_file)
    end

    assert_redirected_to analysis_response_files_url
  end
end
