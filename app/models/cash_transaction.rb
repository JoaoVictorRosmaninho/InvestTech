class CashTransaction < ApplicationRecord
  belongs_to :fund

  def self.listTransactionsWithFund
    all
      .select("id, fund_id, desc_transaction, value_transaction, date_transaction")
      .includes(:fund)
      .order(:id)
      .as_json(include: {fund: {only: [:name_fund]}})
  end
  
  def self.totalCashTransactions(id, date)
  all
      .select("fund_id, sum(value_transaction) as balance")
      .group("fund_id")
      .where(fund_id: id)
      .where("date_transaction = ?", date)
      .as_json(only: [:balance])
  end

end

