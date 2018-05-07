require 'test_helper'

class PhantomModuleFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phantom_module_file = phantom_module_files(:one)
  end

  test "should get index" do
    get phantom_module_files_url
    assert_response :success
  end

  test "should get new" do
    get new_phantom_module_file_url
    assert_response :success
  end

  test "should create phantom_module_file" do
    assert_difference('PhantomModuleFile.count') do
      post phantom_module_files_url, params: { phantom_module_file: {  } }
    end

    assert_redirected_to phantom_module_file_url(PhantomModuleFile.last)
  end

  test "should show phantom_module_file" do
    get phantom_module_file_url(@phantom_module_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_phantom_module_file_url(@phantom_module_file)
    assert_response :success
  end

  test "should update phantom_module_file" do
    patch phantom_module_file_url(@phantom_module_file), params: { phantom_module_file: {  } }
    assert_redirected_to phantom_module_file_url(@phantom_module_file)
  end

  test "should destroy phantom_module_file" do
    assert_difference('PhantomModuleFile.count', -1) do
      delete phantom_module_file_url(@phantom_module_file)
    end

    assert_redirected_to phantom_module_files_url
  end
end
