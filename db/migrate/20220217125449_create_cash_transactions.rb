class CreateCashTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :cash_transactions do |t|
      t.text :desc_transaction
      t.float :valor_transaction
      t.date :data_transection
      t.integer :fund_id

      t.timestamps
    end
  end
end
