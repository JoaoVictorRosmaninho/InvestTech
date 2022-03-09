class PortifoliosController < ApplicationController  
  def index
    #render json: SecuritysTransaction.security_information(params[:id], Date.parse(params[:date]))
  end
  
  def totalAtivos
    date = params[:date] ? params[:date] : Date.today 
    render json: SecuritysTransaction.security_information(params[:id], date);
  end  

  def totalCashTransactions
    date = params[:date] ? params[:date] : Date.today
    render json: CashTransaction.totalCashTransactions(params[:id], date)
  end

  def listTransactionsByFund
    date = params[:date] ? params[:date] : Date.today
    render json: CashTransaction.listTransactionsByFund(params[:id], date)
  end

  def PLfund
    date = params[:date] ? params[:date] : Date.today
    totalSecurityTransactions = SecuritysTransaction
      .where("fund_id = ? and date_transaction <= ?", params[:id], date)
      .sum("value_transaction * quantity")  
    totalCashTransactions = CashTransaction
      .where("fund_id = ? and date_transaction <= ?", params[:id], date)
      .sum("value_transaction")
    totalOverall = totalSecurityTransactions + totalCashTransactions
    render json: {pl: totalOverall}
  end
end
