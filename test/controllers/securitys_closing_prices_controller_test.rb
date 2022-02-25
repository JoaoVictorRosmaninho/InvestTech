require "test_helper"

class SecuritysClosingPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @securitys_closing_price = securitys_closing_prices(:one)
  end

  test "should get index" do
    get securitys_closing_prices_url
    assert_response :success
  end

  test "should get new" do
    get new_securitys_closing_price_url
    assert_response :success
  end

  test "should create securitys_closing_price" do
    assert_difference("SecuritysClosingPrice.count") do
      post securitys_closing_prices_url, params: { securitys_closing_price: { closing_price: @securitys_closing_price.closing_price, date_closing: @securitys_closing_price.date_closing, security_id: @securitys_closing_price.security_id } }
    end

    assert_redirected_to securitys_closing_price_url(SecuritysClosingPrice.last)
  end

  test "should show securitys_closing_price" do
    get securitys_closing_price_url(@securitys_closing_price)
    assert_response :success
  end

  test "should get edit" do
    get edit_securitys_closing_price_url(@securitys_closing_price)
    assert_response :success
  end

  test "should update securitys_closing_price" do
    patch securitys_closing_price_url(@securitys_closing_price), params: { securitys_closing_price: { closing_price: @securitys_closing_price.closing_price, date_closing: @securitys_closing_price.date_closing, security_id: @securitys_closing_price.security_id } }
    assert_redirected_to securitys_closing_price_url(@securitys_closing_price)
  end

  test "should destroy securitys_closing_price" do
    assert_difference("SecuritysClosingPrice.count", -1) do
      delete securitys_closing_price_url(@securitys_closing_price)
    end

    assert_redirected_to securitys_closing_prices_url
  end
end
