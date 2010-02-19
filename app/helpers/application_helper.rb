# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def admin_area?
    params[:controller] =~ /administration/
  end

  def menu_to(name, options = {}, html_options = {}, &block)
    content = link_to(name, options, html_options, &block)
    if current_page?(options)
      "<li class=\"selected\">#{content}</li>"
    else
      "<li>#{content}</li>"
    end
  end
end
