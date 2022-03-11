class SecuritysTransaction < ApplicationRecord
	belongs_to :security
	has_many   :securitys_closing_prices, through: :security
	belongs_to :fund

	def self.transactions
		all.select("id, fund_id, security_id")
		includes(:security, :fund)
		.order(:id)
		.as_json({include: {security: {only: [:security_simbol]}, fund: {only: [:name_fund]}}})
	end

	def to_h
		{
			security: {
				security_simbol: security.security_simbol, 
				id: security_id
			}, 
			security_quantity: security_quantity, 
			
		}
	end
	
	
	def self.security_information(fund_id, date)
		all.select("security_id,  sum(quantity) as security_quantity")
		   .group("security_id") 
		   .where(fund_id: fund_id)
		   .where("date_transaction <= ?", date)
		   .having("sum(quantity) <> 0")
		   .includes(:security, :securitys_closing_prices)
    end




=begin	def self.security_information(fund_id, date)
		 securitys = SecuritysTransaction.select("security_id").group("security_id").joins(:security).where(fund_id: fund_id);
		 date_closing_price = date.to_date
		 wallet = [];
		 prices = [];
		 names  = []
		 securitys.each do |security|
			prices.push(SecuritysClosingPrice.sendPriceClose(security.security_id, (date_closing_price - 1)) )
		 end 
		 securitys.each do |security|
			names.push(Security.where(id: security.security_id).group(:security_simbol).pluck(:security_simbol))
		 end 
		 quantity_securitys = 
		 	all.select("sum(quantity) as security_quantity")
			.group("security_id") 
			.where(fund_id: fund_id)
			.where("date_transaction <= ?", date)
			.having("sum(quantity) <> 0")
		
			for i in 0..(securitys.length-1)
			if (quantity_securitys[i])
				wallet.push({"symbol": names[i].first, "price": prices[i], "quantity": quantity_securitys[i]}) 
			end
		end
		wallet.as_json		 
	end
=end

=begin	def self.security_information(fund_id, date)
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
=end
	def self.security_total(fund_id, date)
		all
			.select("fund_id, sum(value_transaction) as balance")
			.group("fund_id")
			.where(fund_id: fund_id)
			.as_json
	end

end

=begin         quantity_securitys = 
		 	all.select("sum(quantity) as security_quantity")
            	.group("security_id") 
		 		.where(fund_id: fund_id)
		 		.where("date_transaction <= ?", date)
		 		.having("sum(quantity) <> 0")
=end




