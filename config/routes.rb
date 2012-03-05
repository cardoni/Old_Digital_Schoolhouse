DigitalSchoolhouse::Application.routes.draw do

  root :to => 'home#index'
  
  resources :attachments
  resources :users
  resources :sessions
  resources :posts

  get '/logout' => 'sessions#logout', :as => :logout
  get '/login' => 'sessions#new', :as => :login
  get 'about' => 'home#about', :as => 'about_page'
  
end
