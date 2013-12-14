class FurnitureApp < Sinatra::Base
  get '/chair' do
    erb :chair_form
  end

  post '/chair' do
    name = params[:name]
    description = params[:description]

    "#{name.upcase} #{description.upcase}"
  end

  get '/lamp' do
    erb :lamp_form
  end

  post '/lamp' do
    params[:lamp][:colors].join(',')
  end

  get '/table' do
    erb :table_form
  end

  post '/table' do
    table = params[:table]

    "#{table[:name].upcase} #{table[:wood].upcase} #{table[:price]}"
  end
end
