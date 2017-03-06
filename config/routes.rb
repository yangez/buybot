Rails.application.routes.draw do

  root to: 'sessions#new'

  resources :sessions, only: [:new, :create]
  get '/auth/:provider/callback', to: 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
