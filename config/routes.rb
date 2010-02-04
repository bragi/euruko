ActionController::Routing::Routes.draw do |map|

  map.resource :user_session
  map.resources :users, :only => [:new, :create]

  map.root :controller => 'home'
end
