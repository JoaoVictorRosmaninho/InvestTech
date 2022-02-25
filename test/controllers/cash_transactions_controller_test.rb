require "test_helper"

class CashTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cash_transaction = cash_transactions(:one)
  end

  test "should get index" do
    get cash_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_cash_transaction_url
    assert_response :success
  end

  test "should create cash_transaction" do
    assert_difference("CashTransaction.count") do
      post cash_transactions_url, params: { cash_transaction: { data_transection: @cash_transaction.data_transection, desc_transaction: @cash_transaction.desc_transaction, fund_id: @cash_transaction.fund_id, valor_transaction: @cash_transaction.valor_transaction } }
    end

    assert_redirected_to cash_transaction_url(CashTransaction.last)
  end

  test "should show cash_transaction" do
    get cash_transaction_url(@cash_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_cash_transaction_url(@cash_transaction)
    assert_response :success
  end

  test "should update cash_transaction" do
    patch cash_transaction_url(@cash_transaction), params: { cash_transaction: { data_transection: @cash_transaction.data_transection, desc_transaction: @cash_transaction.desc_transaction, fund_id: @cash_transaction.fund_id, valor_transaction: @cash_transaction.valor_transaction } }
    assert_redirected_to cash_transaction_url(@cash_transaction)
  end

  test "should destroy cash_transaction" do
    assert_difference("CashTransaction.count", -1) do
      delete cash_transaction_url(@cash_transaction)
    end

    assert_redirected_to cash_transactions_url
  end
end
