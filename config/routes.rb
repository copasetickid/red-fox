Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }

  resources :users

  resources :stores do
    resources :stock_items, path: "stock-items", controller: "store_stock_items"
  end

  resources :stock_items, path: "stock-items"

  namespace :api do
    namespace :v1 do
      resources :stores, only: [:index, :show, :create]
      resources :stock_items, path: "stock-items"
      resources :users, only: [:index]
    end
  end
end
