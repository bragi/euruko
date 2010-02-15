class UserSessionsController < ApplicationController
  resource_controller
  create.wants.html {redirect_to current_user}

  def destroy
    current_user_session.destroy
    redirect_to root_path
  end
end
