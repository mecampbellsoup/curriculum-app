class ApplicationController < Sinatra::Base

  # Configure Sinatra to reload directories like models and controllers.
  configure :development, :test do
    register Sinatra::Reloader
    register Sinatra::Twitter::Bootstrap::Assets
    set :root, RootFolder
    set :views, Proc.new { File.join(root, "app/views") }
  end

end
