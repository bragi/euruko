class Administration::UsersController < Administration::ApplicationController
  resource_controller
  create.wants.html {redirect_to administration_users_path}
end
