Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :meetings, except: [:new]

  resources :chemicals

  resources :optical_elements

  resources :posts

  resource :user do
    resource :profile, :controller => "user_profiles"
  end

end
