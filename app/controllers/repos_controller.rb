class ReposController < ApplicationController

  get '/' do
    # list all the yaml tags
    # e.g. languages: ruby, javascript
    # make tags clickable
    # need a method that basically goes through each readme, pushes the yaml hash keys into an array, and returns us that array
    @labs = Lab.all
    erb :labs
  end

  # get '/:tag' do
  #   # e.g. /languages
  #   # should show clickable list like this: ruby, javascript, sql, etc. 
  #   @tag = params[:tag]
  #   @tag_names = Lab.tag_names_from_id(params[:tag])
  #   erb :tag_names
  # end

  # get '/:tag/:tag_id' do
  #   @labs = Lab.by_tag_with_id(params[:tag], params[:tag_id])
  #   erb :labs
  # end

end