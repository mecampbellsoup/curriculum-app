module ReposHelper
	def view_tree(directory)
		if directory["type"] == "dir"
			render partial: "list_subs", :locals => {:sub_directory => directory}
		else
			link_to directory["name"], directory["url"]
		end
	end

	def parse_repo_tree(sub_directory)
  	JSON.parse(open("#{sub_directory["url"]}&access_token=#{Repo.find(params[:id]).user.token}").read)
  end
  
  def is_project?(repo)
    return true if repo.project_id != nil
  end
end
