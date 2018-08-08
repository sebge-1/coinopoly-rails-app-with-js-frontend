Rails.application.routes.draw do
  resources :users do
    resources :portfolios
  end

  root to: 'application#welcome'
  post   '/signin',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
