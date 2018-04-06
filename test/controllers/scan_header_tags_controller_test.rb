require 'test_helper'

class ScanHeaderTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scan_header_tag = scan_header_tags(:one)
  end

  test "should get index" do
    get scan_header_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_scan_header_tag_url
    assert_response :success
  end

  test "should create scan_header_tag" do
    assert_difference('ScanHeaderTag.count') do
      post scan_header_tags_url, params: { scan_header_tag: { key: @scan_header_tag.key, label: @scan_header_tag.label, mime_type_id: @scan_header_tag.mime_type_id, value_type: @scan_header_tag.value_type } }
    end

    assert_redirected_to scan_header_tag_url(ScanHeaderTag.last)
  end

  test "should show scan_header_tag" do
    get scan_header_tag_url(@scan_header_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_scan_header_tag_url(@scan_header_tag)
    assert_response :success
  end

  test "should update scan_header_tag" do
    patch scan_header_tag_url(@scan_header_tag), params: { scan_header_tag: { key: @scan_header_tag.key, label: @scan_header_tag.label, mime_type_id: @scan_header_tag.mime_type_id, value_type: @scan_header_tag.value_type } }
    assert_redirected_to scan_header_tag_url(@scan_header_tag)
  end

  test "should destroy scan_header_tag" do
    assert_difference('ScanHeaderTag.count', -1) do
      delete scan_header_tag_url(@scan_header_tag)
    end

    assert_redirected_to scan_header_tags_url
  end
end
