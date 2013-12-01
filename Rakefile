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