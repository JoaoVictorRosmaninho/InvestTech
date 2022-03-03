class SecuritysTransaction < ApplicationRecord
	belongs_to :security
	belongs_to :fund
=begin	
	def self.security_information(fund_id, date=Date.today)
			all.select("security_id, sum(quantity) as quantity")
			.group("security_id")
			.where(fund_id: fund_id)
			.where("date_transaction <= ?", date)
			.having("sum(quantity) <> 0")
			.includes(:security)
	end
=end
 
	def self.transactions
		all.select("securitys_transactions.id as id,  
			 name_fund, desc_transaction, 
			 value_transaction, 
			 security_simbol, 
			 date_transaction, quantity").joins(:fund, :security).as_json;
	end
=begin	
	def self.security_information(fund_id, date)
		all.select("securitys_transactions.id as id, security_id,  sum(quantity) as security_quantity")
	 	.group("id") 
		 .where(fund_id: fund_id)
		 .where("date_transaction <= ?", date)
		 .having("sum(quantity) <> 0")
		 .includes(:security)
	 .as_json(include: {security: {only: [:security_simbol]}})
	end
=end
2	
	def self.security_information(fund_id, date)
 		 all.select("security_id,  sum(quantity) as security_quantity")
		 	.group("security_id") 
		 	.where(fund_id: fund_id)
		 	.where("date_transaction <= ?", date)
		 	.having("sum(quantity) <> 0")
			.includes(:security)
			.as_json(include: {security: {only: [:security_simbol]}})
	end

end





