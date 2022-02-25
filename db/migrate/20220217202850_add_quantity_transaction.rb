class AddQuantityTransaction < ActiveRecord::Migration[7.0]
  def change
    add_column :securitys_transactions, :quantity, :integer
  end
end
