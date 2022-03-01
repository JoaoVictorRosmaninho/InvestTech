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
  get '/precoAtivos', to: 'securitys_closing_prices#index'
  get '/transacaoAtivos', to: 'securitys_transactions#index'
  get "/portifolios/:id/:date", to: "portifolios#index"
  get "/precos/historico", to: "securitys_closing_prices#index"
end
