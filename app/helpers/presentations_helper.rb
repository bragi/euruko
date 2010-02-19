module PresentationsHelper
  def presentation_length(presentation)
    case presentation.length
    when "standard" then "1 hour"
    when "long" then "2 hours"
    when "lightning" then "Lightning talk"
    end
  end

  def presentation_form(presentation, &block)
    options = {:html => { :multipart => true }}
    options[:url] = administration_presentations_path if admin_area?

    form_for(presentation, options, &block)
  end
end
