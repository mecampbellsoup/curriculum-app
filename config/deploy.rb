@application_name = "curriculum-app"
@application_ip_address = "162.243.244.73"
@application_repo = "git@github.com:mecampbellsoup/curriculum-app.git"

require "bundler/capistrano"
require "rvm/capistrano"

set :application, @application_name
set :server_ip, @application_ip_address
set :repository, @application_repo
set :use_sudo, false
set :user, "deployer"
set :deploy_to, "/home/#{user}/#{application}"
set :scm, :git

set :rvm_type, :system

default_run_options[:pty] = true

role :app, server_ip
role :web, server_ip
role :db, server_ip, :primary => true

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

end

namespace :db do
  desc <<-DESC
    Creates the database.yml configuration file in shared path.

    By default, this task uses a template unless a template 
    called database.yml.erb is found either is :template_dir 
    or /config/deploy folders. The default template matches 
    the template for config/database.yml file shipped with Rails.

    When this recipe is loaded, db:setup is automatically configured 
    to be invoked after deploy:setup. You can skip this task setting 
    the variable :skip_db_setup to true. This is especially useful 
    if you are using this recipe in combination with 
    capistrano-ext/multistaging to avoid multiple db:setup calls 
    when running deploy:setup for all stages one by one.
  DESC
  task :setup, :except => { :no_release => true } do

    default_template = <<-EOF
    base: &base
      adapter: sqlite3
      timeout: 5000
    development:
      database: #{shared_path}/db/development.sqlite3
      <<: *base
    test:
      database: #{shared_path}/db/test.sqlite3
      <<: *base
    production:
      database: #{shared_path}/db/production.sqlite3
      <<: *base
    EOF

    location = fetch(:template_dir, "config/deploy") + '/database.yml.erb'
    template = File.file?(location) ? File.read(location) : default_template

    config = ERB.new(template)

    run "mkdir -p #{shared_path}/db"
    run "mkdir -p #{shared_path}/config"
    put config.result(binding), "#{shared_path}/config/database.yml"
  end

  desc <<-DESC
    [internal] Updates the symlink for database.yml file to the just deployed release.
  DESC
  task :symlink, :except => { :no_release => true } do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

end

after "deploy:setup",           "db:setup"   unless fetch(:skip_db_setup, false)
after "deploy:finalize_update", "db:symlink"