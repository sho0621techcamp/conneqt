Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  root to: 'tutors#index'
  resources :tutors
  resources :messages
  resources :room, only: :show
end
