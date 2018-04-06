Rails.application.routes.draw do
  resources :categories
  resources :articles
  get 'home/index'
  root "articles#index"
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
