class UserSessionsController < ApplicationController
  resource_controller
  create.wants.html {redirect_to current_user}
end
