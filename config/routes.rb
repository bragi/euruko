ActionController::Routing::Routes.draw do |map|

  map.resource :user_session
  map.resources :presentations
  map.resources :users

  map.root :controller => 'home'
end
