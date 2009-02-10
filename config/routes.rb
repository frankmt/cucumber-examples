ActionController::Routing::Routes.draw do |map|
  map.root :controller => "main", :action => "index"
  
  map.resources :items
  map.resources :special_items
  map.connect ':controller/:action/:id'

  if ENV['RAILS_ENV'] == 'test'
    map.connect '/factories/:action', :controller => 'factories'
  end
end
