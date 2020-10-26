Rails.application.routes.draw do
  get 'posts/index'
  devise_for :users
  root "posts#index"
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
end
