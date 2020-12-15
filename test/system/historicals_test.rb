require "application_system_test_case"

class HistoricalsTest < ApplicationSystemTestCase
  setup do
    @historical = historicals(:one)
  end

  test "visiting the index" do
    visit historicals_url
    assert_selector "h1", text: "Historicals"
  end

  test "creating a Historical" do
    visit historicals_url
    click_on "New Historical"

    fill_in "Content", with: @historical.content
    fill_in "Title", with: @historical.title
    click_on "Create Historical"

    assert_text "Historical was successfully created"
    click_on "Back"
  end

  test "updating a Historical" do
    visit historicals_url
    click_on "Edit", match: :first

    fill_in "Content", with: @historical.content
    fill_in "Title", with: @historical.title
    click_on "Update Historical"

    assert_text "Historical was successfully updated"
    click_on "Back"
  end

  test "destroying a Historical" do
    visit historicals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Historical was successfully destroyed"
  end
end
