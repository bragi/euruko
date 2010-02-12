class Administration::AdminSessionsController < Administration::ApplicationController
  resource_controller

  skip_before_filter :require_admin, :except => :destroy

  create.wants.html {redirect_to administration_root_path}
  create.flash "You are now logged in as admin"
end
