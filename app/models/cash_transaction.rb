class CashTransaction < ApplicationRecord
  belongs_to :fund
  
  def as_json(_option)
    super({ 
      only: [:id, :name_fund, :desc_transaction, :valor_transaction, :data_transection]
    })
  end
end
