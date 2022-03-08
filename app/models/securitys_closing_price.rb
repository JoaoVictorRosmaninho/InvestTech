class SecuritysClosingPrice < ApplicationRecord
  belongs_to :security

  def self.sendPrice(security_id, date) 
    all
      .select("security_id, closing_price, date_closing")
      .where(security_id: security_id)
      .where("date_closing <= ?", date)
      .order("date_closing desc")
      .limit(1)
      .as_json(only: :closing_price)
  end

  def self.closingPrices 
    all
      .select("id, closing_price, date_closing, security_id")
      .includes(:security)
      .as_json(include: {security: {only: [:security_simbol]}})
  end
  

  def self.shift_date(date) 
    while (date.saturday? || date.sunday?)
      date -= 1 
    end
    return date
  end

end
