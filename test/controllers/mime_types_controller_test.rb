require 'test_helper'

class MimeTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mime_type = mime_types(:one)
  end

  test "should get index" do
    get mime_types_url
    assert_response :success
  end

  test "should get new" do
    get new_mime_type_url
    assert_response :success
  end

  test "should create mime_type" do
    assert_difference('MimeType.count') do
      post mime_types_url, params: { mime_type: { description: @mime_type.description, name: @mime_type.name } }
    end

    assert_redirected_to mime_type_url(MimeType.last)
  end

  test "should show mime_type" do
    get mime_type_url(@mime_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_mime_type_url(@mime_type)
    assert_response :success
  end

  test "should update mime_type" do
    patch mime_type_url(@mime_type), params: { mime_type: { description: @mime_type.description, name: @mime_type.name } }
    assert_redirected_to mime_type_url(@mime_type)
  end

  test "should destroy mime_type" do
    assert_difference('MimeType.count', -1) do
      delete mime_type_url(@mime_type)
    end

    assert_redirected_to mime_types_url
  end
end
