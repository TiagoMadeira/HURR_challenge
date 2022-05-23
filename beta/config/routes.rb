Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  post 'home' => 'home#add_blocked_dates_to_user', as: :add_blocked_dates_to_user
  mount API::Base, at: "/"
end
