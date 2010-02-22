class PasswordsController < ApplicationController
  resource_controller

  before_filter :require_user

  actions :edit, :update

  def update
    current_user.password = params[:user][:password]
    current_user.password_confirmation = params[:user][:password_confirmation]
    if current_user.save
      flash[:notice] = "Password successfully changed"
      redirect_to current_user
    else
      render :action => :edit
    end
  end
end
