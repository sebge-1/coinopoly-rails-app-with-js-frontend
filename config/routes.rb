Rails.application.routes.draw do
  resources :users do
    resources :portfolios

    member do
      get :follow
      get :unfollow
    end
  end

  resources :portfolios do
    resources :positions
  end

  resource :coins

  root to: 'application#welcome'
  post   '/signin',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create_from_facebook'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
