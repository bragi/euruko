class BillingInformationsController < ApplicationController
  resource_controller

  before_filter :require_user

  create.before {@object.user = current_user}
  create.wants.html {redirect_to user_path(current_user)}
end
