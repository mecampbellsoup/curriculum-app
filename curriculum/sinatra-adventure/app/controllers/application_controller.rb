class ApplicationController < Sinatra::Base
  enable :sessions
  set :views, File.expand_path('../../views', __FILE__)

  configure :development do
    register Sinatra::Reloader
  end

end
