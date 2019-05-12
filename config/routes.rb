Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: 'dashboard#index'

  get '/audit', to: 'audits#index'

  resources :ticket_conversations, only: [:show, :update, :create, :new, :edit]
  resources :users, only: [:index, :show, :update, :create, :new, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
