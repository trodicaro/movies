Rails.application.routes.draw do
  root :to => 'home#index'
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
end
