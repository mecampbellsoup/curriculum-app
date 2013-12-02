require 'bundler'

Bundler.require

# The environment task helps other tasks bootstrap the environment.
task :environment do |cmd, args|
  ENV["RACK_ENV"] ||= "development"
  require "./config/environment"
end

desc 'Load a pry console'
task :console => [:environment] do
  Pry.start
end

# IMPORTANT - READ THIS TASK!
# This method populates the curriculum directory with labs. 
desc 'Clone lab repositories (plus some other magic)'
task :clone_repos => [:environment] do
  # Pretty sure we have already required the needed file on line 8 above
  # require './lib/lab_cloner'

  # Let's instantiate and call. Make sure to read through the Cloner class.
  cloner = LabCloner.new(
      'git@github.com:flatiron-school/flatiron-kitchen-ruby-003.git',
      'git@github.com:flatiron-school/amoeba-circus-on-rails-ruby-003.git',
      'git@github.com:flatiron-school/pollywog-ranch-associations-ruby-003.git'
  )
  cloner.call
end