Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items do
    #  collection do
    #   patch 'update'
    #  end
     resources :orders, only: :index
  end
end