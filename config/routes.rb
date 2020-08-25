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

  resources :categories

  resources :optical_elements, except: [:show] do
    member do
      post "toggle_flag" => "optical_elements#toggle_flag"
    end
  end

  resources :posts, except: [:show] do
    member do
      post "collect" => "posts#collect"
      post "cancel" => "posts#cancel"
    end
  end

  resources :users

  namespace :account do
    resources :posts, except: [:show]
    resources :users
    resources :collects, except: [:show] do
      member do
        post "cancel" => "collects#cancel"
      end
    end
  end

end
