class RegistrationsController < ApplicationController

  get '/register' do
    @error = params[:error]
    erb :register
  end

  post '/register' do
    session[:email] = params[:email]
    redirect "/new"
  end

  get '/new' do
    @email = session[:email]
    if !user_registered?
      redirect '/register?error=register'
    else
      erb :new_user
    end
  end

  def user_registered?
    !@email.nil?
  end

end
