class AlterColumnCashNames < ActiveRecord::Migration[7.0]
  def change
    rename_column :cash_transactions, :valor_transaction, :value_transaction
    rename_column :cash_transactions, :data_transection, :date_transaction
  end
end