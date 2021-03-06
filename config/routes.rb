Rails.application.routes.draw do
  get 'welcome/index'
  root 'home#index'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :welcome, only: [:index]
  resources :meals do
    get 'meals', on: :collection
    get 'recipes', on: :collection
    get 'show_details', on: :collection
    get 'search', on: :collection
  end
  resources :likes, only: [:create, :update]
  resources :weeks
  resources :my_meals
  resources :measures
  resources :ingredients
  resources :foods
end
