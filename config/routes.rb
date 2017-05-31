Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :posts
  resources :bulletins do
    resources :posts
  end
end