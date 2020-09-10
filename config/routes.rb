Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items do
     resources :orders, only: [:index, :create, :new]
     resources :messages, only: [:create]
     collection do
      get 'search'
    end
  end
end