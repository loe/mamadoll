ActionController::Routing::Routes.draw do |map|
  
  map.resources :episodes, :has_many => :comments, :member => { :latest => :get }
  map.resources :pages
  map.resources :people

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
  
  # You can have the root of your site routed by hooking up '' 
  map.root :controller => 'episodes', :action => 'latest'
end
