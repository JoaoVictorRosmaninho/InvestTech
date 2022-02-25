class PortifoliosController < ApplicationController  
  def index
    render json: SecuritysTransaction.security_information(params[:id], Date.parse(params[:date]))
  end
end
