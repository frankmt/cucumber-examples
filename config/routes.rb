ActionController::Routing::Routes.draw do |map|
  map.root :controller => "items", :action => "index"
  
  map.resources :items
  map.connect ':controller/:action/:id'
end
