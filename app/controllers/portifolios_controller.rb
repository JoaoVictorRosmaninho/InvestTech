class PortifoliosController < ApplicationController  
  def index
    #render json: SecuritysTransaction.security_information(params[:id], Date.parse(params[:date]))
  end
  
  def totalAtivos 
    render json: SecuritysTransaction.security_information(params[:id], params[:date] ? params[:date] : Date.today);
  end  

  def totalCashTransactions
    render json: CashTransaction.totalCashTransactions(params[:id], params[:date] ? params[:date] : Date.today)
  end

  def PLfund
    date = params[:date] ? params[:date] : Date.today
    totalSecurityTransactions = SecuritysTransaction
      .where("fund_id = ?", params[:id])
      .sum("value_transaction * quantity")  
    totalCashTransactions = CashTransaction
      .where("fund_id = ?", params[:id])
      .sum("value_transaction")
    totalOverall = totalSecurityTransactions + totalCashTransactions
    render json: {pl: totalOverall}
  end
end
