class CashTransaction < ApplicationRecord
  belongs_to :fund
  
  def as_json(_option)
    super({ 
      only: [:id, :name_fund, :desc_transaction, :value_transaction, :date_transaction]
    })
  end
end
