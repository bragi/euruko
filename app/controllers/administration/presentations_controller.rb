class Administration::PresentationsController < Administration::ApplicationController
  resource_controller

  create.wants.html {redirect_to administration_presentations_path}
end
