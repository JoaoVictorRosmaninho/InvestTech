class CreateSecuritysClosingPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :securitys_closing_prices do |t|
      t.float :closing_price
      t.date :date_closing
      t.integer :security_id

      t.timestamps
    end
  end
end
