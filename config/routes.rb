ActionController::Routing::Routes.draw do |map|

  map.resource :user_session
  map.resource :billing_information
  map.resource :password_reset
  map.resource :password
  map.resources :presentations
  map.resources :users

  map.namespace :administration do |administration|
    administration.root :controller => 'home'
    administration.resource :admin_session
    administration.resources :presentations
    administration.resources :users
  end

  map.root :controller => 'home'
end
