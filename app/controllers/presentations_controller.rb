class PresentationsController < ApplicationController
  resource_controller
  
  before_filter :require_user, :except => [:index, :show]
  before_filter :require_owner, :only => [:update]
  before_filter :enforce_submission_deadline, :only => [:new, :create]
  
  create.before {object.user = current_user}
  create.wants.html {redirect_to current_user}

  update.wants.html {redirect_to current_user}
  
  def enforce_submission_deadline
    send_unauthorized if Presentation.deadline_reached?
  end
end
