require 'sinatra'

class TestApp < Sinatra::Base
  #put your route handlers here

  get '/' do 
  end

  post '/' do
  end

  get '/about' do
    erb :about
  end

  get '/hello' do
    @name = params[:name]
    erb :hello
  end
end
