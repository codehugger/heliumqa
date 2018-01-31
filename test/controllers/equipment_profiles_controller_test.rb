require 'test_helper'

class EquipmentProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipment_profile = equipment_profiles(:one)
  end

  test "should get index" do
    get equipment_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_equipment_profile_url
    assert_response :success
  end

  test "should create equipment_profile" do
    assert_difference('EquipmentProfile.count') do
      post equipment_profiles_url, params: { equipment_profile: { name: @equipment_profile.name, profile_data: @equipment_profile.profile_data, site_id: @equipment_profile.site_id } }
    end

    assert_redirected_to equipment_profile_url(EquipmentProfile.last)
  end

  test "should show equipment_profile" do
    get equipment_profile_url(@equipment_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_equipment_profile_url(@equipment_profile)
    assert_response :success
  end

  test "should update equipment_profile" do
    patch equipment_profile_url(@equipment_profile), params: { equipment_profile: { name: @equipment_profile.name, profile_data: @equipment_profile.profile_data, site_id: @equipment_profile.site_id } }
    assert_redirected_to equipment_profile_url(@equipment_profile)
  end

  test "should destroy equipment_profile" do
    assert_difference('EquipmentProfile.count', -1) do
      delete equipment_profile_url(@equipment_profile)
    end

    assert_redirected_to equipment_profiles_url
  end
end
