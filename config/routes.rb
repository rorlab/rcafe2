Rails.application.routes.draw do
  resources :posts
  resources :bulletins do
    resources :posts
  end

  root 'welcome#index'
end