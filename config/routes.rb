Rails.application.routes.draw do

  root to: "home#top"
  devise_for :users

  resources :books, only: [:index, :show, :create, :destroy, :edit, :update]
  resources :users, only: [:index, :show, :create, :edit, :update]
  get '/home/about', to: 'home#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
