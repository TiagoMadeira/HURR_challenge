require "application_system_test_case"

class BlockedDatesTest < ApplicationSystemTestCase
  setup do
    @blocked_date = blocked_dates(:one)
  end

  test "visiting the index" do
    visit blocked_dates_url
    assert_selector "h1", text: "Blocked Dates"
  end

  test "creating a Blocked date" do
    visit blocked_dates_url
    click_on "New Blocked Date"

    click_on "Create Blocked date"

    assert_text "Blocked date was successfully created"
    click_on "Back"
  end

  test "updating a Blocked date" do
    visit blocked_dates_url
    click_on "Edit", match: :first

    click_on "Update Blocked date"

    assert_text "Blocked date was successfully updated"
    click_on "Back"
  end

  test "destroying a Blocked date" do
    visit blocked_dates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blocked date was successfully destroyed"
  end
end
