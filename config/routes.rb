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
  match '/auth/:provider/callback', :to => 'home#create', via: [:get, :post]
  match '/auth/failure', :to => 'home#failure', via: [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
