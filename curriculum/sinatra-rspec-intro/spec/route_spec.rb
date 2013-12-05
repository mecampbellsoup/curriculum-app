require_relative 'spec_helper'

describe "routes" do

  # this is something that Rack::Test needs defined
  # in order to run tests against the Sinatra App
  # you'll see it inside each of our top-level describes

  def app
    TestApp
  end

  # notice that we are only checking for a valid route
  # and not any content specifically. These are "route"
  # tests that define what routes our application handles
  # the tests for our individual routes and the operations
  # they perform are in the other spec files

  # separation of concerns applies in tests, too!

  it "handles GET to /" do
    # 'get' is a helper from Rack::Test
    # which is included in spec_helper.
    # it specifies a get request.

    get '/'

    # be_ok is a helper from Rack::Test

    expect(last_response).to be_ok

    # be_ok is the equivalent
    # of checking for HTTP status code 200

    expect(last_response.status).to eq(200)
  end

  it "handles POST to /" do
    # 'post' is a helper from Rack::Test
    # it specifies a post request.

    post '/'
    expect(last_response).to be_ok
  end

  it "handles GET to /about" do
    get '/about'
    expect(last_response).to be_ok
  end

  it "handles GET to /hello" do
    get '/hello'
    expect(last_response).to be_ok
  end
end
