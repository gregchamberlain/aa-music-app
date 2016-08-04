Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]

  resources :sessions, only: [:create, :new]
  delete 'sessions/destroy', to: 'sessions#destroy'

  resources :bands
  resources :albums
  resources :tracks

  resources :notes, only: [:create, :destroy]
end
