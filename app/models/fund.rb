class Fund < ApplicationRecord
  has_many :cash_transactions
  has_many :securitys_transactions
  
  def as_json(_option)
    super({ 
      only: [:id, :name_fund, :desc_fund, :creation_date] 
    })
  end
end
