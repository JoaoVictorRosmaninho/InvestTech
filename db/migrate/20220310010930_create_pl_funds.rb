class CreatePlFunds < ActiveRecord::Migration[7.0]
  def change
    create_table :pl_funds do |t|
      t.float :closing_pl
      t.date :closing_date
      t.integer :fund_id

      t.timestamps
    end
  end
end
