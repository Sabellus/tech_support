Rails.application.routes.draw do
  devise_for :users

  root to: 'dashboard#index'

  resources :ticket_conversations, only: [:show, :update, :create, :new, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
