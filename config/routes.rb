Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  namespace :admin do
    resources :stations, only: [:index, :create, :destroy]
    resources :searches, only: [:new, :index]
    resources :users, only: [:show]
  end

  resources :searches, only: [:new, :index]
  resources :vehicles
  resources :users, only: [:new, :create, :show]
  resources :stations, only: [:index]
  resources :favorites, only: [:index, :create, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
