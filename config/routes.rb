Rails.application.routes.draw do
  devise_for :users

  # ✅ Rutas para usuarios autenticados y no autenticados
  authenticated :user do
    root to: "chats#index", as: :authenticated_root
  end

  unauthenticated do
    root to: "devise/sessions#new", as: :unauthenticated_root
  end

  resources :users
  resources :chats
  resources :messages
end
