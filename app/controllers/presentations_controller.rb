class PresentationsController < ApplicationController
  resource_controller
  
  before_filter :require_user
  
  actions :new, :show, :create
  
  create.wants.html {redirect_to current_user}
  create.before {object.user = current_user}
end
