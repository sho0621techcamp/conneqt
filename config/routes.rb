Rails.application.routes.draw do
  devise_for :users
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  root to: 'tutors#index'
  resources :tutors do
    resources :users do
      resources :messages, only: [:show, :create]
    end
  end
end
