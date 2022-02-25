require "test_helper"

class SecuritysTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @securitys_transaction = securitys_transactions(:one)
  end

  test "should get index" do
    get securitys_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_securitys_transaction_url
    assert_response :success
  end

  test "should create securitys_transaction" do
    assert_difference("SecuritysTransaction.count") do
      post securitys_transactions_url, params: { securitys_transaction: { date_transaction: @securitys_transaction.date_transaction, desc_transaction: @securitys_transaction.desc_transaction, fund_id: @securitys_transaction.fund_id, security_id: @securitys_transaction.security_id, value_transaction: @securitys_transaction.value_transaction } }
    end

    assert_redirected_to securitys_transaction_url(SecuritysTransaction.last)
  end

  test "should show securitys_transaction" do
    get securitys_transaction_url(@securitys_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_securitys_transaction_url(@securitys_transaction)
    assert_response :success
  end

  test "should update securitys_transaction" do
    patch securitys_transaction_url(@securitys_transaction), params: { securitys_transaction: { date_transaction: @securitys_transaction.date_transaction, desc_transaction: @securitys_transaction.desc_transaction, fund_id: @securitys_transaction.fund_id, security_id: @securitys_transaction.security_id, value_transaction: @securitys_transaction.value_transaction } }
    assert_redirected_to securitys_transaction_url(@securitys_transaction)
  end

  test "should destroy securitys_transaction" do
    assert_difference("SecuritysTransaction.count", -1) do
      delete securitys_transaction_url(@securitys_transaction)
    end

    assert_redirected_to securitys_transactions_url
  end
end
