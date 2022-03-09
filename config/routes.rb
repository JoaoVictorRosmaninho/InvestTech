Rails.application.routes.draw do
  resources :securitys_transactions
  resources :securitys_closing_prices
  resources :securities
  resources :cash_transactions
  resources :funds
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/fundos', to: 'funds#index'
  get '/transacaoCaixa', to: 'cash_transactions#index'
  get '/ativos', to: 'securities#index'

  get '/precoAtivos/:id/:date', to: 'securitys_closing_prices#getPrice'
  get '/precoAtivos/:id', to: 'securitys_closing_prices#getPrice'
  get '/precoAtivos', to: 'securitys_closing_prices#index'

  get '/transacaoAtivos', to: 'securitys_transactions#index'
  get "/precos/historico", to: "securitys_closing_prices#index"
  #portifolio
  get "/portifolios/saldo/:id/:date", to: "portifolios#totalCashTransactions"
  get "/portifolios/saldo/:id", to: "portifolios#totalCashTransactions"
  get "/portifolios/transacoes/:id", to: "portifolios#listTransactionsByFund"
  get "/portifolios/transacoes/:id/:date", to: "portifolios#listTransactionsByFund"

  get "/portifolios/ativos/:id/:date", to: "portifolios#totalAtivos"
  get "/portifolios/ativos/:id", to: "portifolios#totalAtivos"

  get "/portifolios/pl/:id/:date", to: "portifolios#PLfund"
  get "/portifolios/pl/:id", to: "portifolios#PLfund"
end
