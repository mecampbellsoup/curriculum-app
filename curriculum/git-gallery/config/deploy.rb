require 'bundler/capistrano' # for bundler support

set :application, "git-gallery"
set :repository,  "git@github.com:flatiron-school/git-gallery.git"

set :branch, fetch(:branch, "master")
set :env, fetch(:env, "production")

set :user, 'teambuilt_admin'
set :deploy_to, "/home/#{ user }/#{ application }"
set :use_sudo, false

set :scm, :git

default_run_options[:pty] = true

role :web, "192.241.176.137"                          # Your HTTP server, Apache/etc
role :app, "192.241.176.137"                          # This may be the same as your `Web` server
role :db, "192.241.176.137"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end

  task :symlink_config, :roles => :app do 
    run "ln -nfs #{shared_path}/production.sqlite3 #{current_release}/db/production.sqlite3"
    run "ln -nfs #{shared_path}/public #{current_release}/public"
  end
end

after 'deploy:update_code', 'deploy:symlink_config'