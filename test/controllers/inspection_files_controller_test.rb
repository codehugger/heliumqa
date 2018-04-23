require 'test_helper'

class QaSessionFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @qa_session_file = qa_session_files(:one)
  end

  test "should get index" do
    get qa_session_files_url
    assert_response :success
  end

  test "should get new" do
    get new_qa_session_file_url
    assert_response :success
  end

  test "should create qa_session_file" do
    assert_difference('QaSessionFile.count') do
      post qa_session_files_url, params: { qa_session_file: {
        scan_protocol_id: @qa_session_file.scan_protocol_id,
        file_data: @qa_session_file.file_data,
        qa_session_id: @qa_session_file.qa_session_id,
        probed_at: @qa_session_file.probed_at,
        profile_header: @qa_session_file.profile_header,
        profiled_at: @qa_session_file.profiled_at } }
    end

    assert_redirected_to qa_session_file_url(QaSessionFile.last)
  end

  test "should show qa_session_file" do
    get qa_session_file_url(@qa_session_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_qa_session_file_url(@qa_session_file)
    assert_response :success
  end

  test "should update qa_session_file" do
    patch qa_session_file_url(@qa_session_file), params: { qa_session_file: {
      scan_protocol_id: @qa_session_file.scan_protocol_id,
      file_data: @qa_session_file.file_data,
      qa_session_id: @qa_session_file.qa_session_id,
      probed_at: @qa_session_file.probed_at,
      profile_header: @qa_session_file.profile_header,
      profiled_at: @qa_session_file.profiled_at } }
    assert_redirected_to qa_session_file_url(@qa_session_file)
  end

  test "should destroy qa_session_file" do
    assert_difference('QaSessionFile.count', -1) do
      delete qa_session_file_url(@qa_session_file)
    end

    assert_redirected_to qa_session_files_url
  end
end
