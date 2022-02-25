class AddDescColumSecurity < ActiveRecord::Migration[7.0]
  def change
    add_column :securities, :security_desc, :text
  end
end
