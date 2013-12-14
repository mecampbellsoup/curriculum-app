require "bundler"
Bundler.require

require "sinatra"
require "active_record"
require "sinatra/activerecord"
require "sinatra/reloader"

set :database, "sqlite3:///db/development.db"

require_relative '../app/models/pond'
require_relative '../app/models/frog'
require_relative '../app/models/tadpole'
require_relative '../app/controllers/application_controller'