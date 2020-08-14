Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :meetings

  resources :chemicals

  resources :optical_elements

  resources :posts

end
