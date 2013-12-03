class ApplicationController < Sinatra::Base

  helpers do
    
  end

  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores
  
  set :root, RootFolder
  set :views, Proc.new { File.join(root, "app/views") }

  # Configure Sinatra to reload directories like models and controllers.
  configure :development, :test do
    register Sinatra::Reloader
    Dir.glob(File.join(root, "/app/models") + "/*") do |path|
      also_reload path
    end
    also_reload File.join(root, "/app/concerns/searchable.rb")
  end

end
