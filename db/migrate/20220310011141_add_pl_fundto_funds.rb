class AddPlFundtoFunds < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :pl_funds, :funds
  end
end
