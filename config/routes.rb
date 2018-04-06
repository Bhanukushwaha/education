Rails.application.routes.draw do
  get 'admin/index'

  resources :categories
  resources :articles
  get 'home/index'
  root "home#index"
  devise_for :users
  resources :users
  namespace :admin, module: nil  do
    root "admin#index"
    resources :users
    resources :categories
    resources :articles
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
