class ApplicationController < Sinatra::Base

  # Later, when repos are private, we may need to authenticate
  enable :sessions

  helpers Sinatra::FormHelpers

  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores
  
  set :root, RootFolder
  set :views, Proc.new { File.join(root, "app/views") }

  # Configure Sinatra to reload directories like models and controllers.
  configure :development, :test do
    enable :logging, :dump_errors, :raise_errors
    register Sinatra::Reloader
    Dir.glob(File.join(root, "/app/models") + "/*") do |path|
      also_reload path
    end
    also_reload File.join(root, "/app/concerns/searchable.rb")
  end

  helpers do
    def deploy_partial(lab)
      erb :_deploy, :locals => { lab: lab }
    end

    def breadcrumbs_partial(filter, filter_id=nil)
      erb :_breadcrumbs, :locals => { filter: filter, filter_id: filter_id }
    end
  end

end
