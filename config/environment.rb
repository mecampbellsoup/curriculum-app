require 'yaml'
require 'json'
require 'open-uri'
require 'sinatra/form_helpers'

Dotenv.load

RootFolder = File.expand_path(File.dirname(__FILE__)).gsub('/config', '')

def get_reqs(current_dir)
  Dir.foreach(current_dir) do |file|
    next if file.start_with?('.') || file.start_with?('environment.rb') || file.end_with?('spec.rb') # add additional filters here for files you don't want included
    if File.directory?(current_dir + '/' + file)
      next if file.start_with?('templates')
      get_reqs(current_dir + '/' + file)
    else
      require_relative (current_dir + '/' + file) if file.end_with?('.rb')
    end
  end
end

# Explicitly require view helpers first here so they can be mixed-in with my controllers
require_relative '../app/helpers/date_helper'

Dir.foreach(RootFolder) do |file|
  next if file.start_with?('.') || file.start_with?('curriculum')
  get_reqs(RootFolder + '/' + file) if File.directory?(RootFolder + '/' + file)
end
