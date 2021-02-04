Rails.application.routes.draw do
  get 'sessions/login'
  get 'sessions/logout'
  get 'sessions/signup'
  get 'sessions/oauth_login'
  resources :users
  resources :purchases
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
