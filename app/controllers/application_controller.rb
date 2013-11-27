class ApplicationController < Sinatra::Base

  # Configure Sinatra to reload directories like models and controllers.
  configure :development, :test do
    register Sinatra::Reloader
  end

end
