require "application_system_test_case"

class SecuritysTransactionsTest < ApplicationSystemTestCase
  setup do
    @securitys_transaction = securitys_transactions(:one)
  end

  test "visiting the index" do
    visit securitys_transactions_url
    assert_selector "h1", text: "Securitys transactions"
  end

  test "should create securitys transaction" do
    visit securitys_transactions_url
    click_on "New securitys transaction"

    fill_in "Date transaction", with: @securitys_transaction.date_transaction
    fill_in "Desc transaction", with: @securitys_transaction.desc_transaction
    fill_in "Fund", with: @securitys_transaction.fund_id
    fill_in "Security", with: @securitys_transaction.security_id
    fill_in "Value transaction", with: @securitys_transaction.value_transaction
    click_on "Create Securitys transaction"

    assert_text "Securitys transaction was successfully created"
    click_on "Back"
  end

  test "should update Securitys transaction" do
    visit securitys_transaction_url(@securitys_transaction)
    click_on "Edit this securitys transaction", match: :first

    fill_in "Date transaction", with: @securitys_transaction.date_transaction
    fill_in "Desc transaction", with: @securitys_transaction.desc_transaction
    fill_in "Fund", with: @securitys_transaction.fund_id
    fill_in "Security", with: @securitys_transaction.security_id
    fill_in "Value transaction", with: @securitys_transaction.value_transaction
    click_on "Update Securitys transaction"

    assert_text "Securitys transaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Securitys transaction" do
    visit securitys_transaction_url(@securitys_transaction)
    click_on "Destroy this securitys transaction", match: :first

    assert_text "Securitys transaction was successfully destroyed"
  end
end
