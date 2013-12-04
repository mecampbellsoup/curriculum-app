class ReposController < ApplicationController
  
  before do
    @labs = Lab.all
    @tags = Lab.get_tags(@labs)
  end

  get '/' do
    # @tags = Lab.get_tags(@labs)
    erb :tags
  end

  get '/:tag' do
    # e.g. /languages
    # should show clickable list like this: ruby, javascript, sql, etc. 
    @tag = params[:tag]
    @tag_names = Lab.tag_names_from_category(@tag, @labs)
    erb :tag_names
  end

  get '/:lab/readme' do
    @lab = Lab.find_by_name(params[:lab])
    @lab.readme = RDiscount.new(@lab.readme).to_html
    erb :readme
  end

  get '/:tag/:tag_id' do
    @tag, @tag_id = params[:tag], params[:tag_id]
    @matching_labs = Lab.matching_tag_id(@labs, @tag, @tag_id)
    erb :labs
  end

  post '/:lab/deploy' do
    # code for deploying new repo goes here!
  end

end