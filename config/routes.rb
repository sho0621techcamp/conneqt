Rails.application.routes.draw do
  devise_for :users
  devise_for :tutors
  root to: "messages#index"
  resources :messages
end
