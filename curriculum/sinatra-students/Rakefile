# We need to go over what a Rakefile or Rake task is, but this is the
# least important part of this code base.

# What this file does is provide you (and our test suite), an easy way
# to trigger migrations to run along with a scrape_students task.

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
# This is the method in which you will initiate the scrape
# of the student site to populate your development database. 
desc 'Scrape the student site'
task :scrape_students => [:environment] do
  # First, load the student scraper, it isn't really part of our environment
  # only this task needs it.
  require './lib/student_scraper'

  # Let's instantiate and call. Make sure to read through the StudentScraper class.
  scraper = StudentScraper.new('http://students.flatironschool.com')
  scraper.call
end

namespace :db do
  desc "Run database migrations"
  task :migrate => [:environment] do |cmd, args|
    env = ENV['RACK_ENV'] || "development"
    puts "Migrating the #{env} database."
 
    require 'sequel/extensions/migration'
    Sequel::Migrator.apply(DB, "db/migrate")
  end
 
  desc "Rollback the database"
  task :rollback => [:environment] do |cmd, args|
    env = ENV['RACK_ENV'] || "development"
 
    require 'sequel/extensions/migration'
    version = (row = DB[:schema_info].first) ? row[:version] : nil
    Sequel::Migrator.apply(DB, "db/migrate", version - 1)
  end
 
  desc "Nuke the database (drop all tables)"
  task :nuke => [:environment] do |cmd, args|
    env = ENV['RACK_ENV'] || "development"
    puts "Nuking the #{env} database."

    DB.tables.each do |table|
      DB.run("DROP TABLE #{table}")
    end
  end
 
  desc "Reset the database"
  task :reset => [:nuke, :migrate]
end