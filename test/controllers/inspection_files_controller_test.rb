require 'test_helper'

class InspectionFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inspection_file = inspection_files(:one)
  end

  test "should get index" do
    get inspection_files_url
    assert_response :success
  end

  test "should get new" do
    get new_inspection_file_url
    assert_response :success
  end

  test "should create inspection_file" do
    assert_difference('InspectionFile.count') do
      post inspection_files_url, params: { inspection_file: {
        scan_protocol_id: @inspection_file.scan_protocol_id,
        file_data: @inspection_file.file_data,
        inspection_id: @inspection_file.inspection_id,
        probed_at: @inspection_file.probed_at,
        profile_header: @inspection_file.profile_header,
        profiled_at: @inspection_file.profiled_at } }
    end

    assert_redirected_to inspection_file_url(InspectionFile.last)
  end

  test "should show inspection_file" do
    get inspection_file_url(@inspection_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_inspection_file_url(@inspection_file)
    assert_response :success
  end

  test "should update inspection_file" do
    patch inspection_file_url(@inspection_file), params: { inspection_file: {
      scan_protocol_id: @inspection_file.scan_protocol_id,
      file_data: @inspection_file.file_data,
      inspection_id: @inspection_file.inspection_id,
      probed_at: @inspection_file.probed_at,
      profile_header: @inspection_file.profile_header,
      profiled_at: @inspection_file.profiled_at } }
    assert_redirected_to inspection_file_url(@inspection_file)
  end

  test "should destroy inspection_file" do
    assert_difference('InspectionFile.count', -1) do
      delete inspection_file_url(@inspection_file)
    end

    assert_redirected_to inspection_files_url
  end
end
