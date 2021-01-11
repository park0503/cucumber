Rails.application.routes.draw do
  devise_for :users
  resources :items
  root "items#index"
  get "users/mypage"
  resources :users do
    collection do
      get :mypage
    end
  end
  resources :line_items do
    member do
      delete :destroy_in_cart
    end
  end
  resources :orders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
