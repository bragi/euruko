module UsersHelper
  def user_form(presentation, &block)
    options = {:html => { :multipart => true }}
    options[:url] = administration_users_path if admin_area?

    form_for(presentation, options, &block)
  end
end
