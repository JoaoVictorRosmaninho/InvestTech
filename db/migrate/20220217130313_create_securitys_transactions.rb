class CreateSecuritysTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :securitys_transactions do |t|
      t.text :desc_transaction
      t.float :value_transaction
      t.date :date_transaction
      t.integer :fund_id
      t.integer :security_id

      t.timestamps
    end
  end
end
