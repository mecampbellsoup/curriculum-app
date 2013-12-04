require 'sinatra/form_helpers'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  # Later, when repos are private, we may need to authenticate
  enable :sessions

  register Sinatra::Flash
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

  helpers Sinatra::FormHelpers

  helpers do
    def deploy_partial(lab)
      erb :_deploy, :locals => { lab: lab }
    end

    def breadcrumbs_partial(filter, filter_id=nil)
      erb :_breadcrumbs, :locals => { filter: filter, filter_id: filter_id }
    end

    def flash_messages_partial(flash)
      erb :_flash_messages, :locals => { flash: flash }
    end

    def bootstrap_class_for(flash_type)
      {success: 'alert-success', error: 'alert-error', warning: 'alert-warning'}[flash_type] || flash_type.to_s
    end
  end

end
