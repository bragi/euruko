class UsersController < ApplicationController
  resource_controller
  create.flash "Your account was created"
  create.wants.html {redirect_to root_path}
end
