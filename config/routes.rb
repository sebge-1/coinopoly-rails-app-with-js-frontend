Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'application#welcome'

  get '/logout',  to: 'sessions#destroy'
  get 'users/:id/follower_feed' => 'activities#follower_feed'
  get 'activities/index'

  post '/signin', to: 'sessions#create'

  resources :coins
  resources :relationships, only: [:create, :destroy]

  resources :users do
    resources :portfolios
    member do
      get :following, :followers
    end
  end

  resources :portfolios do
    resources :positions
  end
end
