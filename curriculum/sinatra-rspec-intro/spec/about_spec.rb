require_relative 'spec_helper'

describe "about page" do

  def app
    TestApp
  end

  it "renders the about erb template" do
    get '/about'
    expect(last_response.body).to include "This is a sinatra app"
    expect(last_response.body).to include "<!-- about.erb -->"
  end

end


