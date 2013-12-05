class ReposController < ApplicationController
  
  before do
    @labs = Lab.all
    @tags = Lab.get_tags(@labs)
  end

  get '/' do
    erb :tags
  end

  post '/search' do
    @matching_labs = Lab.find_by_search_query(params["query"])
    @tags = Lab.get_tags(@matching_labs)
    @tag = @tags.sample
    erb :labs
  end

  get '/:tag' do
    # e.g. /languages
    # should show clickable list like this: ruby, javascript, sql, etc
    @tag = params[:tag]
    @tag_names = Lab.tag_names_from_category(@tag, @labs)
    erb :tag_names
  end

  get '/:tag/:tag_id' do
    @tag, @tag_id = params[:tag], params[:tag_id]
    @matching_labs = Lab.matching_tag_id(@labs, @tag, @tag_id)
    # @matching_labs.each do |lab|
    #   binding.pry
    #   lab.readme.gsub!(/-{3}.*-{3}/, "")
    #   # need to escape the newlines i think...
    # end
    erb :labs
  end

  post '/:lab/deploy' do
    # code for deploying new repo goes here!
    class_id, semester_id = params[:deploy][:class], params[:deploy][:semester]
    new_lab_name = "#{params[:lab]}-#{class_id}-#{semester_id}"
    path = File.join(Dir.pwd, "/lib/create_remote.sh")
    origin_master_url = "git@github.com:mecampbellsoup/#{new_lab_name}.git"
    local_lab_path = File.join(Dir.pwd, "/curriculum/#{params[:lab]}")
    system("source #{path} '#{ENV['GITHUB_OAUTH_TOKEN']}' '#{new_lab_name}' '#{local_lab_path}' '#{origin_master_url}'")
    # TODO: add error handling for this part...
    flash[:success] = "You successfully made a new lab repo!  Check it out at: #{origin_master_url}"
    redirect to "/"
  end

  # private

  # def repo_params
  #   params.must_include_key(:lab).permit(:class, :semester)
  # end

end