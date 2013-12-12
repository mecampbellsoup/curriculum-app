module SlidesHelper
  def slide_prompt(feature)
    if feature.uploads.count == 0 && feature.snippets.count == 0
      render :partial => 'new_slide_prompt'
    else
      render :partial => 'slideshow_builder', :locals => {:feature => feature}
    end
  end

  def render_slide(slide_type)
    if slide_type 
      render :partial => slide_partial_name(slide_type), :locals => {:snippet => slide_type }
    end
  end

  def slide_partial_name(slide_type)
    "projects/features/slide_#{slide_type.class.to_s.downcase}"
  end
end