ActionController::Routing::Routes.draw do |map|

  map.resource :user_session

  map.root :controller => 'home'
end
