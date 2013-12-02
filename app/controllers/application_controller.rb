class ApplicationController < Sinatra::Base

  # Configure Sinatra to reload directories like models and controllers.
  configure :development, :test do
    set :root, RootFolder
    register Sinatra::Reloader
    Dir.glob(File.join(root, "/app/models") + "/*") do |path|
      also_reload path
    end
    also_reload File.join(root, "/app/concerns/searchable.rb")
    set :views, Proc.new { File.join(root, "app/views") }
  end

end
