Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/card_masters/new', to: 'card_masters#new'
  get '/card_masters/new/category/:category_id', to: 'card_masters#new'
  get '/card_masters/category/:category_id', to: 'card_masters#index'
  get '/lessons/category/:category_id', to: 'lessons#show'
  resources :users
  resources :card_masters
  resources :card_categories
  resources :lessons
end