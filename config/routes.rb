Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :meetings, except: [:new, :show]
  get "/meetings/print", to: "meetings#print"

  resources :chemicals, except: [:show] do
    member do
      post "toggle_flag" => "chemicals#toggle_flag"
    end
  end

  resources :optical_elements, except: [:show]

  resources :posts

  resource :user, except: [:show]  do
    resource :profile, :controller => "user_profiles"
  end

end
