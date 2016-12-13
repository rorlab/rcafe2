Rails.application.routes.draw do
  resources :bulletins
  resources :posts
  root 'welcome#index'
  #get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
