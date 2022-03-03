json.extract! cash_transaction, :id, :desc_transaction, :value_transaction, :date_transaction, :fund_id, :created_at, :updated_at
json.url cash_transaction_url(cash_transaction, format: :json)
