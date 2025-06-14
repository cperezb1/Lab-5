Rails.application.routes.draw do
  # Rutas para Devise
  devise_for :users

  # Rutas para usuarios
  resources :users, only: [:index, :show, :edit, :update]

  # Chats y mensajes anidados
  resources :chats do
    resources :messages, only: [:create]  # ✅ anidado correctamente para chat_messages_path
  end

  # Redirección para usuarios autenticados
  authenticated :user do
    root to: 'chats#index', as: :authenticated_root
  end

  # Redirección para usuarios no autenticados
  unauthenticated do
    devise_scope :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
