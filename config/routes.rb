Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :chats
  resources :messages
  resources :users

  root "users#index"
end
