Rails.application.routes.draw do
  resources :users
  resources :chats
  resources :messages
  resources :users

  root "users#index"
end
