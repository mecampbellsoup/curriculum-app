require 'bundler'

Bundler.require

# Make sure our default RACK_ENV is development if it has not been set
# by the global environment.
ENV['RACK_ENV'] ||= 'development'

# Load our environment.
require './app'
require './config/environment'

run CurriculumApp
