Rails.application.routes.draw do
  get 'tutors/show'
  mount ActionCable.server => '/cable'
  devise_for :users
  devise_for :tutors
  root to: "messages#index"
  resources :messages
  resources :tutors, only: :show
  resources :room, only: :show
end
