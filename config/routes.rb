Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  get 'room/show'
  devise_for :users
  devise_for :tutors
  root to: "messages#index"
  resources :messages
  resources :room, only: [:show]
end
