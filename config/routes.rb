Paintbox::Application.routes.draw do



  resources :sessions, :only => [:new, :create, :destroy]

  resources :swatches
  
  # resources :swatches do
  #   collection do
  #     post :sort
  #   end
  # end
    
  # resources :swatches do
  #   resources :users
  # end
  
  # resources :users do
  #   resources :swatches
  # end
  

  match 'about',    :to => 'pages#about',       :as => :about
  match 'signup',   :to => 'users#new',         :as => :signup
  match 'login',   :to => 'sessions#new',      :as => :login
  match 'logout',  :to => 'sessions#destroy',  :as => :logout
  match 'settings', :to => 'users#edit',        :as => :settings

  resources :users

  # match 'users/:username', :to => 'users#show'
  match '/:username', :to => 'users#show'

  # scope '/:username' do
  #   resources :swatches
  # end

  root :to => "pages#home"

end

# Rails 2
# ActionController::Routing::Routes.draw do |map|
# 
#   map.resources   :sessions, :only => [:new, :create, :destroy]
#   map.resources   :swatches, :only => [:create, :destroy], :collection => { :sort => :post }
#   map.resources   :users
#   # map.resources   :pages
#   # map.resources :colors
# 
#   map.about     'about',    :controller => 'pages',     :action => 'about'  
#   map.signup    'signup',   :controller => 'users',     :action => 'new'  
#   map.signin    'signin',   :controller => 'sessions',  :action => 'new'
#   map.signout   'signout',  :controller => 'sessions',  :action => 'destroy'
#   # map.settings  'settings', :controller => 'users',     :action => 'edit'
# 
# 
#   # map.user    '/:id', :controller => 'users', :action => 'show'
# 
# 
#   map.root :controller => 'pages', :action => 'home'
# 
# 
#   # Install the default routes as the lowest priority.
#   map.connect ':controller/:action/:id'
#   map.connect ':controller/:action/:id.:format'
# end
