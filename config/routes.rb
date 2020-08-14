Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :meetings

  resources :chemicals

end
