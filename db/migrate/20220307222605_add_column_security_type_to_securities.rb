class AddColumnSecurityTypeToSecurities < ActiveRecord::Migration[7.0]
  def change
    add_column :securities, :security_type, :string
  end
end
