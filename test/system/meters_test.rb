require "application_system_test_case"

class MetersTest < ApplicationSystemTestCase
  setup do
    @meter = meters(:one)
  end

  test "visiting the index" do
    visit meters_url
    assert_selector "h1", text: "Meters"
  end

  test "creating a Meter" do
    visit meters_url
    click_on "New Meter"

    fill_in "End Date", with: @meter.end_date
    fill_in "Readings", with: @meter.readings
    fill_in "Start Date", with: @meter.start_date
    click_on "Create Meter"

    assert_text "Meter was successfully created"
    click_on "Back"
  end

  test "updating a Meter" do
    visit meters_url
    click_on "Edit", match: :first

    fill_in "End Date", with: @meter.end_date
    fill_in "Readings", with: @meter.readings
    fill_in "Start Date", with: @meter.start_date
    click_on "Update Meter"

    assert_text "Meter was successfully updated"
    click_on "Back"
  end

  test "destroying a Meter" do
    visit meters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meter was successfully destroyed"
  end
end
