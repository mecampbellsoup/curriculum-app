class ReposController < ApplicationController

  get '/.json' do
    content_type :json
    Lab.read_files.first.to_json
  end

  get '/labs' do
    "Hello again, world!"
  end

end