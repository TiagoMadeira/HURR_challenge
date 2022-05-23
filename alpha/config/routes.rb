Rails.application.routes.draw do
  resources :blocked_dates
  devise_for :users
  get 'home/index'
  post 'home' => 'home#add_blocked_dates_to_user', as: :add_blocked_dates_to_user
  root to: "home#index"
  mount API::Base, at: "/"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
