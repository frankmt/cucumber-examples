ActionController::Routing::Routes.draw do |map|
  map.root :controller => "main", :action => "index"
  
  map.resources :items
  map.resources :special_items
end
