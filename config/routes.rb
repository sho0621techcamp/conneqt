Rails.application.routes.draw do
  devise_for :tutors
  devise_for :users
  resources :messages
end
