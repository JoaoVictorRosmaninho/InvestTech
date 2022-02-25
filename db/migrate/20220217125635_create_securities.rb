class CreateSecurities < ActiveRecord::Migration[7.0]
  def change
    create_table :securities do |t|
      t.string :security_simbol
      t.date :creation_date

      t.timestamps
    end
  end
end
