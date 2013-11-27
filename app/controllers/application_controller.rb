class ApplicationController < Sinatra::Base

  # Configure Sinatra to reload directories like models and controllers.
  configure :development, :test do
    register Sinatra::Reloader
    also_reload "models/*.rb"
    binding.pry # check above line
    set :root, RootFolder
    set :views, Proc.new { File.join(root, "app/views") }
  end

end
