ActionController::Routing::Routes.draw do |map|
  map.root :controller => "items", :action => "index"
  
  map.resources :items
  
  if ENV['RAILS_ENV'] == 'test'
    map.connect '/factories/:action', :controller => 'factories'
  end
end
