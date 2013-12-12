require 'bundler/capistrano'

set :whenever_command, "bundle exec whenever"
require 'whenever/capistrano'


set :application, "handraise-app"
set :repository,  "git@github.com:flatiron-school/handraise.git"

set :user, 'handraise'
set :deploy_to, "/home/#{ user }/#{ application }"
set :use_sudo, false

set :scm, :git

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "handrai.se"                          # Your HTTP server, Apache/etc
role :app, "handrai.se"                          # This may be the same as your `Web` server
role :db,  "handrai.se", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts
before "deploy:assets:precompile", "deploy:symlink_shared"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/setup.yml #{release_path}/config/setup.yml"
  end
end

