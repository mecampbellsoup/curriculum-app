class ReposController < ApplicationController

  get '/' do
    @labs = Lab.read_file_system
    erb :labs
  end

  get '/:tag' do
    # list all the yaml tags
    # e.g. languages: ruby, javascript
    # make tags clickable
  end

  get '/:tag/:tag_id' do
    @labs = Lab.by_tag_with_id(params[:tag], params[:tag_id])
    erb :labs
  end

end