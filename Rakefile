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
# This method populates the curriculum directory. 
desc 'Clone lab repositories (plus some other magic)'
task :clone_repos => [:environment] do
  # Pretty sure we have already required the needed file on line 8 above
  # require './lib/student_scraper'

  # Let's instantiate and call. Make sure to read through the Cloner class.
  cloner = Cloner.new(
      'git@github.com:flatiron-school/flatiron-kitchen-ruby-003.git'
  )
  cloner.call
end