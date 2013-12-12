module ProjectsHelper
	def link_to_project_image(project)
		if project.upload
			link_to image_tag(project.upload.image_url.to_s), project_path(project)
		else
			link_to image_tag("http://octodex.github.com/images/octocat-de-los-muertos.jpg"), project_path(project)
		end
	end

	def project_image(project)
		if project.upload
			link_to( image_tag(project.upload.image_url.to_s), project_path(project))
		else
			link_to( image_tag("http://octodex.github.com/images/octocat-de-los-muertos.jpg"), project_path(project))
		end
	end

	def user_dependent_view(project, attribute)
		if project.editable_by?(current_user)
			render partial: "projects/hero/edit_project_#{attribute}", :locals => {:project => project}
		else
			project.send(attribute)
		end
	end

	def user_dependent_edit(project)
		if project.editable_by?(current_user)
			render partial: "projects/hero/edit_project_button", :locals => {:project => project}
		end
	end

	def image_link(project)
		if project.upload
		 "#{project.upload.image_url.to_s}"
		else
			"http://octodex.github.com/images/octocat-de-los-muertos.jpg"
		end
	end

	def default_description
		"Add a Description"
	end

	def no_slides_message(feature)
		current_user == feature.user ? "No Slides Yet! Add Some!" : "#{feature.user.name.split.first} hasn't added any slides yet!"
	end
end
