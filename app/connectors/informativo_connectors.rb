
class InformativoConnectors  
  include HTTParty
  base_uri 'https://api.informativos.io'
  
  def self.securities(types=[])
    get('/securities', query: { security_types: types })
  end

  def self.prices(types=[])
    date = SecuritysClosingPrice.shift_date(Date.today - 1);
    get("/prices/#{date}", query: {security_types: types})
  end

end

