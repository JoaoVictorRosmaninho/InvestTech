class AddForeignKeyCashTransactions < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :cash_transactions, :funds 
    add_foreign_key :securitys_closing_prices, :securities
    add_foreign_key :securitys_transactions, :funds 
    add_foreign_key :securitys_transactions, :securities
  end
end
