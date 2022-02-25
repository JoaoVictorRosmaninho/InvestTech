class SecuritysTransaction < ApplicationRecord
  belongs_to :security
  belongs_to :fund
  
#  def self.calc_portifolio(fund_id, date=Date.today)
#      all.select("security_id, sum(quantity) as quantity")
#      .group("security_id")
#      .where(fund_id: fund_id)
#      .where("date_transaction <= ?", date)
#      .having("sum(quantity) <> 0")
#      .includes(:security)
#  end
  
  def self.security_information(fund_id, date=Date.today)
      all.select("security_id, sum(quantity) as quantity")
      .group("security_id")
      .where(fund_id: fund_id)
      .where("date_transaction <= ?", date)
      .having("sum(quantity) <> 0")
      .includes(:security)
  end

  def as_json(_option)
      super ({
        only: [:quantity],
        include: { 
          security: { 
            only: [:id, :security_simbol, :security_desc, :creation_date]  
          } 
        }
      })
  end
 end
