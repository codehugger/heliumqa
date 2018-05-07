require "application_system_test_case"

class PhantomModuleFilesTest < ApplicationSystemTestCase
  setup do
    @phantom_module_file = phantom_module_files(:one)
  end

  test "visiting the index" do
    visit phantom_module_files_url
    assert_selector "h1", text: "Phantom Module Files"
  end

  test "creating a Phantom module file" do
    visit phantom_module_files_url
    click_on "New Phantom Module File"

    click_on "Create Phantom module file"

    assert_text "Phantom module file was successfully created"
    click_on "Back"
  end

  test "updating a Phantom module file" do
    visit phantom_module_files_url
    click_on "Edit", match: :first

    click_on "Update Phantom module file"

    assert_text "Phantom module file was successfully updated"
    click_on "Back"
  end

  test "destroying a Phantom module file" do
    visit phantom_module_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Phantom module file was successfully destroyed"
  end
end
