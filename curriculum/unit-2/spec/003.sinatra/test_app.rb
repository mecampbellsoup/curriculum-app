class TestApp < Sinatra::Base
  post '/profile' do
    ""
  end

  get '/search' do
    # DO NOT MODIFY THIS!
    "#{params[:q]} #{params[:order]}"
  end
end
