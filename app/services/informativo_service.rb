class InformativoService
  def import_stocks 
    response = InformativoConnectors.securities(['STOCK']);
    JSON.parse(response.body).each do |row|
      security = Security.find_or_initialize_by(security_simbol: row['symbol'])   
      
      security.security_simbol = row['symbol']
      security.creation_date = Date.today
      security.security_desc = "Ativo referente ao último fechamento da bolsa"
      security.security_type = row['security_type']
      security.save
    end
  end

 def import_prices
    response = InformativoConnectors.prices(['STOCK']);
    JSON.parse(response.body).each do |row|      
      symbolId = Security.find_by(security_simbol: row['symbol'])
      security_price = SecuritysClosingPrice
      .new(
        closing_price: row['close'], 
        date_closing: row['date'], 
        security_id: symbolId.id
      )
      security_price.save
    end
  end
end

