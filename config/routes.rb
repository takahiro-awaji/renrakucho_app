Rails.application.routes.draw do
  get 'posts/index'
  devise_for :users
  root "posts#index"
  resources :posts do
    collection do
      get 'search'
    end
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show] do
    get :likes, on: :collection
  end
end
