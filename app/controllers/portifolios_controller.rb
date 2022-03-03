class PortifoliosController < ApplicationController  
  def index
    #render json: SecuritysTransaction.security_information(params[:id], Date.parse(params[:date]))
  end

 # def totalAtivos
 #      render json: 
 #       SecuritysTransaction.select("security_simbol,  sum(quantity) as security_quantity")
 #         .joins(:security)
 #         .group("security_simbol")
 #         .where(fund_id: params[:id])
 #         .where("date_transaction <= ?", params[:date])
 #         .having("sum(quantity) <> 0")
 # end
  
  def totalAtivos 
    render json: SecuritysTransaction.security_information(params[:id], params[:date] ? params[:date] : Date.today);
  end
  

  def saldoCaixa
    render json: CashTransaction
        .where(fund_id: params[:id])
        .where("data_transection <= ?", params[:date])
        .group("fund_id")
        .sum(:valor_transaction);
  end

end
