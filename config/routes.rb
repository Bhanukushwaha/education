Rails.application.routes.draw do
  get 'admin/index'

  resources :categories
  resources :articles do
    resources :reviews
  end
  get 'home/index'
  root "home#index"
  devise_for :users, :controllers => {:confirmations => 'users/confirmations' }
  resources :users, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end
  get 'change_password' => "users#change_password"
  get 'review' => 'articles#review'
  get 'like' => 'reviews#like'
  get 'dislike' => 'reviews#dislike'
  get '/contact' => "home#contact"
  post "/send_email", to: "home#send_email"
  get '/blog' => "home#blog"
  namespace :admin, module: nil  do
    root "admin#index"
    resources :users
    resources :categories
    resources :articles
    resources :blogs

  end
  match '/auth/:provider/callback', :to => 'home#create', via: [:get, :post]
  match '/auth/failure', :to => 'home#failure', via: [:get, :post]
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
