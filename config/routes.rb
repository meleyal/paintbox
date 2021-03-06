Paintbox::Application.routes.draw do

  resources :sessions, :only => [:new, :create, :destroy]

  resources :swatches

  resources :users do 
    resources :swatches
  end

  # match ':username', :to => 'users#show'
  match 'signup',   :to => 'users#new',         :as => :signup
  match 'login',    :to => 'sessions#new',      :as => :login
  match 'logout',   :to => 'sessions#destroy',  :as => :logout
  match 'settings', :to => 'users#edit',        :as => :settings

  root :to => "swatches#index"

end