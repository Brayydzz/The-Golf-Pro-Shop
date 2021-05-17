Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :equipment_listings

  resources :item_types, only: :index do
    resources :equipment_listings, only: :index
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
