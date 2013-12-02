class ApplicationController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  set :public_folder, Proc.new { File.join(root, "../assets/") }
  set :views, Proc.new { File.join(root, "../views/") }

####### Root #######

  get '/'  do
    erb :index
  end

####### Ponds #######

  get '/ponds'  do
    # Write the code to get all ponds 
    # and send them to the index view listing all ponds.
  
  end

  post '/ponds' do
    # Write the code to save new ponds 
    # and redirect to the index view listing all ponds.
  
  end

  get '/ponds/new' do
    # Write the code to send to the new form view. 

  end

  get '/ponds/:id' do
    # Write the code to find the correct pond
    # by id given in the url.
    # Then send them to the show view.

  end

  get '/ponds/:id/edit' do
    # Write the code to find the correct pond
    # by id given in the url.
    # Then send them to edit form view.

  end

  post '/ponds/:id/update' do
    # Write the code to find the correct pond
    # and set it's attributes and save.
    # Then redirect to the index view listing all ponds.
    
  end

  get '/ponds/:id/destroy' do
    # Write the code to find the correct pond
    # and destroy it.
    # Then redirect to the index view listing all ponds.
    
  end

####### Frogs #######

  get '/frogs'  do
    # Write the code to get all frogs 
    # and send them to the index view listing all frogs.

  end

  post '/frogs' do
    # Write the code to save new frogs 
    # and redirect to the index view listing all frogs.

  end

  get '/frogs/new' do
    # Write the code to send to the new form view.

  end

  get '/frogs/:id' do
    # Write the code to find the correct frog
    # by id given in the url.
    # Then send them to the show view.

  end

  get '/frogs/:id/edit' do
    # Write the code to find the correct frog
    # by id given in the url.
    # Then send them to edit form view.

  end

  post '/frogs/:id/update' do
    # Write the code to find the correct frog
    # and set it's attributes and save.
    # Then redirect to the index view listing all frogs.

  end

  get '/frogs/:id/destroy' do
    # Write the code to find the correct frog
    # and destroy it.
    # Then redirect to the index view listing all frogs.

  end

  get '/frogs/:id/tadpoles/new' do
    # Write the code to find the correct frog
    # and redirect to new tadpole form view
    
  end

####### Tadpoles #######

 get '/tadpoles'  do
    # Write the code to get all tadpoles 
    # and send them to the index view listing all tadpoles.

  end

  post '/tadpoles' do
    # Write the code to create a new tadpole
    # using the attributes included from the new form view.
    # Also set the frog parent using the passed frog_id atribute.
    # Then save and redirect to the index view listing all tadpoles.
    
  end

  get '/tadpoles/:id' do
    # Write the code to find the correct tadpole
    # by id given in the url.
    # Then send them to the show view.

  end

  get '/tadpoles/:id/edit' do
    # Write the code to find the correct tadpole
    # by id given in the url.
    # Then send them to edit form view.

  end

  post '/tadpoles/:id/update' do
    # Write the code to find the correct tadpole
    # and set it's attributes and save.
    # Then redirect to the index view listing all tadpoles.

  end

  get '/tadpoles/:id/destroy' do
    # Write the code to find the correct tadpole
    # and destroy it.
    # Then redirect to the index view listing all tadpoles.

  end

  get '/tadpoles/:id/evolve' do
    # Write the code to find the correct tadpole
    # by id given in the url and store it temporarily.
    # Create a new frog and pass the attributes of the 
    # tadpole into the frog that it is becoming.
    # Then save the new frog and destroy the old tadpole.
    # Then redirect to the index view listing all tadpoles.

  end

end