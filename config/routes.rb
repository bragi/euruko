ActionController::Routing::Routes.draw do |map|

  map.resource :user_session
  map.resource :billing_information
  map.resources :presentations
  map.resources :users

  map.namespace :administration do |administration|
    administration.root :controller => 'home'
    administration.resource :admin_session
  end

  map.root :controller => 'home'
end
