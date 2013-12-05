# here we are setting the environment variable RACK_ENV to 'test'
# so that we can let sinatra and rack know that we are running in test mode

ENV['RACK_ENV'] = 'test'

require_relative '../app'
require 'rack/test'

# These are helpers for rspec that allow us to use things like last_response
# in our tests. We require it at top level in spec_helper so every spec
# that requires spec_helper gets access to them
include Rack::Test::Methods

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.formatter = :documentation

  config.order = 'random'
end
