json.extract! securitys_transaction, :id, :desc_transaction, :value_transaction, :date_transaction, :fund_id, :security_id, :quantity,  :created_at, :updated_at
json.url securitys_transaction_url(securitys_transaction, format: :json)
