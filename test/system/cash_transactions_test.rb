require "application_system_test_case"

class CashTransactionsTest < ApplicationSystemTestCase
  setup do
    @cash_transaction = cash_transactions(:one)
  end

  test "visiting the index" do
    visit cash_transactions_url
    assert_selector "h1", text: "Cash transactions"
  end

  test "should create cash transaction" do
    visit cash_transactions_url
    click_on "New cash transaction"

    fill_in "Data transection", with: @cash_transaction.data_transection
    fill_in "Desc transaction", with: @cash_transaction.desc_transaction
    fill_in "Fund", with: @cash_transaction.fund_id
    fill_in "Valor transaction", with: @cash_transaction.valor_transaction
    click_on "Create Cash transaction"

    assert_text "Cash transaction was successfully created"
    click_on "Back"
  end

  test "should update Cash transaction" do
    visit cash_transaction_url(@cash_transaction)
    click_on "Edit this cash transaction", match: :first

    fill_in "Data transection", with: @cash_transaction.data_transection
    fill_in "Desc transaction", with: @cash_transaction.desc_transaction
    fill_in "Fund", with: @cash_transaction.fund_id
    fill_in "Valor transaction", with: @cash_transaction.valor_transaction
    click_on "Update Cash transaction"

    assert_text "Cash transaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Cash transaction" do
    visit cash_transaction_url(@cash_transaction)
    click_on "Destroy this cash transaction", match: :first

    assert_text "Cash transaction was successfully destroyed"
  end
end
