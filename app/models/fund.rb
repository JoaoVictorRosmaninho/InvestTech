class Fund < ApplicationRecord
  has_many :cash_transactions, dependent: :delete_all
  has_many :securitys_transactions, dependent: :delete_all
  
  def as_json(_option)
    super({ 
      only: [:id, :name_fund, :desc_fund, :creation_date] 
    })
  end
end
