DigitalSchoolhouse::Application.routes.draw do

  resources :countries

  root :to => 'home#index'
  
  resources :attachments
  resources :users
  # edit_user GET    /users/:id/edit(.:format)       users#edit
  get '/users/:id/manage' => 'users#manage', :as => 'manage_user'
  put '/users/:id/change' => 'users#change', :as => 'change_user'
  resources :sessions
  resources :posts
  resources :assets, :only => [:index, :create, :destroy]

  get '/logout' => 'sessions#logout', :as => :logout
  get '/login' => 'sessions#new', :as => :login
  get 'about' => 'home#about', :as => 'about_page'
  
end
