Rails.application.routes.draw do
  devise_for :tutors
  devise_for :users
  root to: "messages#index"
  resources :messages
end
