require './config/environment'
use Rack::Static, :urls => ['/css'], :root => 'app/assets'
run ApplicationController