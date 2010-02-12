class BillingInformationsController < ApplicationController
  resource_controller

  before_filter :require_user
  before_filter :require_owner, :only => :show
  
  actions :new, :show, :create

  create.before {object.user = current_user}
  create.wants.html {redirect_to current_user}
end
