ActionController::Routing::Routes.draw do |map|

  map.resource :user_session
  map.resource :billing_information
  map.resources :presentations
  map.resources :users

  map.root :controller => 'home'
end
