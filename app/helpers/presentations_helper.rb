module PresentationsHelper
  def presentation_length(presentation)
    case presentation.length
    when "standard" then "1 hour"
    when "long" then "2 hours"
    when "lightning" then "Lightning talk"
    end
  end
end
