Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }

  resources :users

  resources :stores do
    resources :stock_items, path: "stock-items", controller: "store_stock_items"
  end

  resources :stock_items, path: "stock-items"
end
