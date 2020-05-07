Rails.application.routes.draw do
  devise_for :users
  resources :games, only: [:index, :show, :borrow]
  root 'games#index'
  get '/games/:id/borrow', to: 'games#borrow', as: 'borrow'
  get '/games/:id/return', to: 'games#return', as: 'return'

  get '/mygames', to: 'games#mygames', as: 'mygames'
  namespace :admin do
    resources :platforms, :users, :games
    get 'games/:id/hide', to: 'games#hide', as: 'hide'
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  