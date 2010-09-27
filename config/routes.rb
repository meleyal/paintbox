ActionController::Routing::Routes.draw do |map|

  map.resources   :sessions, :only => [:new, :create, :destroy]
  map.resources   :swatches, :only => [:create, :destroy], :collection => { :sort => :post }
  map.resources   :users
  # map.resources   :pages
  # map.resources :colors

  map.about     'about',    :controller => 'pages',     :action => 'about'  
  map.signup    'signup',   :controller => 'users',     :action => 'new'  
  map.signin    'signin',   :controller => 'sessions',  :action => 'new'
  map.signout   'signout',  :controller => 'sessions',  :action => 'destroy'
  # map.settings  'settings', :controller => 'users',     :action => 'edit'


  # map.user    '/:id', :controller => 'users', :action => 'show'


  map.root :controller => 'pages', :action => 'home'


  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
