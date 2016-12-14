Rails.application.routes.draw do

  resources :bids
  resources :auctions
  #are handled by sorcery, so these routes should not be accessible
  #get 'user_sessions/new'
  #get 'user_sessions/create'
  #get 'user_sessions/destroy' #or are they included in resources :user_sessions ?

  #get route for welcome_page
  get 'welcome_page/welcome'
  #makes welcome page the root page
  #root 'welcome_page#welcome'

  root :to => 'users#index'
  resources :user_sessions
  resources :users

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
