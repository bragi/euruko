ActionController::Routing::Routes.draw do |map|

  map.resource :user_session
  map.resources :billing_informations
  map.resources :presentations
  map.resources :users

  map.root :controller => 'home'
end
