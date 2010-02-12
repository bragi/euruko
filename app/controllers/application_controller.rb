# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user, :current_admin_session, :current_admin

  [:user, :admin].each do |role|
    current_role_session_name = "current_#{role}_session"
    current_role_name = "current_#{role}"
    require_role_name = "require_#{role}"

    define_method current_role_session_name do
      return instance_variable_get(:"@#{current_role_session_name}") if
        instance_variable_defined?(:"@#{current_role_session_name}")

      session_class = "#{role}_session".camelize.constantize
      instance_variable_set :"@#{current_role_session_name}", session_class.find
    end

    define_method current_role_name do
      return instance_variable_get(:"@#{current_role_name}") if
        instance_variable_defined?(:"@#{current_role_name}")

      current_session = send(current_role_session_name)
      instance_variable_set :"@#{current_role_name}",
        current_session && current_session.send(role)
    end

    define_method require_role_name do
      redirection_path = case role
      when :user then new_user_session_path
      when :admin then new_administration_admin_session_path
      end
      send(current_role_name) || redirect_to(redirection_path)
    end
  end
end
