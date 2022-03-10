class SecuritysTransaction < ApplicationRecord
	belongs_to :security
	has_one   :securitys_closing_prices, through: :security
	belongs_to :fund

	def self.transactions
		all.select("id, fund_id, security_id")
		includes(:security, :fund)
		.order(:id)
		.as_json({include: {security: {only: [:security_simbol]}, fund: {only: [:name_fund]}}})
	end
	
	def self.security_information(fund_id, date)
 		 all.select("security_id,  sum(quantity) as security_quantity")
		 	.group("security_id") 
		 	.where(fund_id: fund_id)
		 	.where("date_transaction <= ?", date)
		 	.having("sum(quantity) <> 0")
			.includes(:security, :securitys_closing_prices)
			.as_json(include: {
				security: {only: [:security_simbol]}, 
				securitys_closing_prices: {only: :closing_price}
			})
	end

	def self.security_total(fund_id, date)
		all
			.select("fund_id, sum(value_transaction) as balance")
			.group("fund_id")
			.where(fund_id: fund_id)
			.as_json
	end

end





