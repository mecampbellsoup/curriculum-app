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
  # Require the Octokit stuff first, which will make LabHashes available for the cloner
  require './lib/octokit'

  # Let's instantiate and call. Make sure to read through the Cloner class.
  cloner = LabCloner.new(*LabHashes.map {|lab| lab[:ssh]})
  cloner.call
end