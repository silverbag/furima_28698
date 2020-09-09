Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items do
     resources :orders, only: [:index, :create, :new]
     resources :messages, only: [:create]
  end
end