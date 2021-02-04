Rails.application.routes.draw do
  get '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'
  get '/signup', to: 'sessions#signup'
  get '/oauth_login', to: 'sessions#oauth'
  resources :users do 
    resources :purchases
  end

  match '/auth/:provider/callback', to: 'sessions#oauth', via: [:get, :post]
  root 'sessions#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
