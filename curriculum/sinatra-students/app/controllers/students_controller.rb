# StudentsController inherits from ApplicationController
# so any settings defined there will apply to this controller.
class StudentsController < ApplicationController

  # GET '/'
  get '/' do
    # Homepage action to display the student index.
    # Load all the students into an instance variable.
    # We use the ::all method on the Student class, provided by Sequel
    @students = Student.all
    erb :'students/index' # render the index.erb within app/views/students
  end

  # Build the rest of the routes here.

  # GET '/students/new'
  # POST '/students'
  # GET '/students/avi-flombaum'
  # GET '/students/avi-flombaum/edit'
  # POST '/students/avi-flombaum'
end
