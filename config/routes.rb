Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :purchase_records, only: [:index, :create]
  end
end
