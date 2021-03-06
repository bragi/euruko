class UsersController < ApplicationController
  resource_controller

  before_filter :require_owner, :only => :show

  actions :new, :create, :show, :index

  create.flash "Your account was created"
end
