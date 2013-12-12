module FeaturesHelper 
  def snippet_or_upload_show(slide)
  	if slide.class == Snippet
  		raw Pygments.highlight(slide.code, lexer: slide.language, width: '700')
  	elsif slide.class == Upload
  		image_tag slide.image_url.to_s, width: '700px' if slide.image?
  	end
  end


  def tech_select_options(technologies)
    render partial: 'features/edit_form_partials/tech_select_options', :locals => {:technologies => technologies}
  end

  def user_dependent_view_for_feature(feature, attribute)
    if feature.editable_by?(current_user)
      render partial: "projects/hero/edit_project_feature_#{attribute}", :locals => {:feat => feature}
    else
      feature.send(attribute)
    end
  end
  
end
