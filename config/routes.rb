Rails.application.routes.draw do
  get 'activities/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :users do
    resources :portfolios
  end
  resources :portfolios do
    resources :positions
  end
  resources :coins
  resources :relationships, only: [:create, :destroy]

  root to: 'application#welcome'
  post   '/signin',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create_from_facebook'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
