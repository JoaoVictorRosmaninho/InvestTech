class Security < ApplicationRecord
  has_many :securitys_closing_prices
  has_many :securitys_transactions


  def as_json(_option)
    super({
      only: [:id, :security_simbol, :security_desc, :creation_date]  
    });
  end
end
