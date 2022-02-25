class Security < ApplicationRecord
  has_many :securitys_closing_prices; 
  has_many :securitys_transactions
end
