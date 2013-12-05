require_relative 'spec_helper'

describe "hello page" do

  def app
    TestApp
  end

  it "takes a name parameter and says hello to that name" do
    get '/hello', :name => "Constantine"
    expect(last_response.body).to eq("Hello, Constantine!")
  end

  it "politely informs that no name was found" do
    get '/hello'
    expect(last_response.body).to eq("I'm sorry, I didn't get your name.")
  end
end
