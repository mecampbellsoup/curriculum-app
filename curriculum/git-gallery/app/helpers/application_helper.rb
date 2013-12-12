module ApplicationHelper
  def link_to_hidden_description(project)
    "<a href= \"../projects/#{project.id} \" class=\"thumbnail with-content\"><img alt=\"Photo-card-big-1\" src=#{image_link(project)}>
        <div class=\"thumbnail-hover-w\">
        <div class=\"thumbnail-hover-text\">  #{project.description.truncate(200) if project.description} </div>
        </div>
        </a>".html_safe
  end

  def mark_required(object, attribute, options = {})
    label = options[:label]
    if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
      label ? "*#{label}" : "*#{attribute.to_s.capitalize}"
    else
      label ? "#{label}" : "#{attribute.to_s.capitalize}"
    end
  end
end
