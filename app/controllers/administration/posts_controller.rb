class Administration::PostsController < ApplicationController
  resource_controller

  create.wants.html {redirect_to administration_posts_path}
  update.wants.html {redirect_to administration_posts_path}
end
