class CreateFunds < ActiveRecord::Migration[7.0]
  def change
    create_table :funds do |t|
      t.string :name_fund
      t.text :desc_fund
      t.date :creation_date

      t.timestamps
    end
  end
end
