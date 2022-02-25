require "application_system_test_case"

class SecuritysClosingPricesTest < ApplicationSystemTestCase
  setup do
    @securitys_closing_price = securitys_closing_prices(:one)
  end

  test "visiting the index" do
    visit securitys_closing_prices_url
    assert_selector "h1", text: "Securitys closing prices"
  end

  test "should create securitys closing price" do
    visit securitys_closing_prices_url
    click_on "New securitys closing price"

    fill_in "Closing price", with: @securitys_closing_price.closing_price
    fill_in "Date closing", with: @securitys_closing_price.date_closing
    fill_in "Security", with: @securitys_closing_price.security_id
    click_on "Create Securitys closing price"

    assert_text "Securitys closing price was successfully created"
    click_on "Back"
  end

  test "should update Securitys closing price" do
    visit securitys_closing_price_url(@securitys_closing_price)
    click_on "Edit this securitys closing price", match: :first

    fill_in "Closing price", with: @securitys_closing_price.closing_price
    fill_in "Date closing", with: @securitys_closing_price.date_closing
    fill_in "Security", with: @securitys_closing_price.security_id
    click_on "Update Securitys closing price"

    assert_text "Securitys closing price was successfully updated"
    click_on "Back"
  end

  test "should destroy Securitys closing price" do
    visit securitys_closing_price_url(@securitys_closing_price)
    click_on "Destroy this securitys closing price", match: :first

    assert_text "Securitys closing price was successfully destroyed"
  end
end
