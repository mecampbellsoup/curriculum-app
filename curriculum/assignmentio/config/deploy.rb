require 'bundler/capistrano'
require "whenever/capistrano"
set :application, "assignmentio-app"
set :repository,  "git@github.com:flatiron-school/assignmentio.git"

set :user, 'assignmentio'
set :deploy_to, "/home/#{user}/#{application}"
set :use_sudo, false

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

default_run_options[:pty] = true

role :web, "96.8.123.64"                          # Your HTTP server, Apache/etc
role :app, "96.8.123.64"                          # This may be the same as your `Web` server
role :db, "96.8.123.64", :primary => true                        # This may be the same as your `Web` server
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
before 'deploy:restart', 'deploy:symlink_uploads'
before 'deploy:assets:precompile', 'deploy:symlink_keys_and_db'
# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :symlink_uploads, :roles => :app do
     run "ln -nfs #{shared_path}/uploads #{release_path}/public"
     run "mkdir #{release_path}/public/download"
     run "mkdir #{release_path}/public/download/assignments"
   end
   task :symlink_keys_and_db do
    run "ln -nfs #{shared_path}/config/keys.yml #{release_path}/config/keys.yml"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
   end
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
