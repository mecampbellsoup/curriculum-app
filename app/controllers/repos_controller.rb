class ReposController < ApplicationController

  get '/' do
    "Hello, world!"
  end

  get '/test' do
    "Hello again, world!"
  end

end