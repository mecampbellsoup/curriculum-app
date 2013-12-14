require_relative '../spec_helper'

describe StudentsController do
  # Every route should be within it's own context.
  context 'GET /' do
    # student will be a new, unsaved student.
    let(:student){Student.new.tap{|s| s.name = "Flatiron Student"}}
    # As your test suite grows, you might need more sample data to correctly
    # test your controllers. For example, when testing updating a student
    # your test object (student), will have to have been saved and you'll have
    # to compare the original student to the updated student and make sure the
    # correct updates occurred. Feel free to create more test objects as you need.

    # BONUS - Use factory_girl https://github.com/thoughtbot/factory_girl

    # For all the tests of the student index, we need the following:
    # 1. To stub out that the Student::all to return our test object student.
    #    This means that our controller tests for the index will not actually
    #    call the ::all method on Student, but rather, stub it out, or fake it.
    #    It's nice if you can isolate your controller tests from the database.
    #    However, feel free to never use something like should_receive and 
    #    just use as many real objects as you want.

    # 2. It creates a mock web request to the route '/' so that our tests
    #    can check the response to that request through the Rack::Test provided
    #    method 'last_response', which will always mean the last response
    #    our test suite triggered.
    before do
      Student.should_receive(:all).and_return([student])
      get '/'
    end

    # A good controller test you can write for every single route/action
    # is to make sure it responds with a 200 status code.
    it 'responds with a 200' do
      # We use the last_response object to test the properties of the response
      # sinatra would send to the request. last_response behaves a lot like an
      # HTTP, with methods to provide a status code and the body of the response
      # A shortcut to checking the status is to just say it is ok with the line below.
      expect(last_response).to be_ok
    end
  
    it 'has the students name in the response' do
      # The body of the last_response is basically the rendered HTML from the view.
      expect(last_response.body).to include(student.name)
    end
  end
  
  context 'GET /students/new' do
  end
  
  context 'POST /students' do
  end

  context 'GET /students/slug' do
  end

  # This context should only be about testing the edit form.
  context 'GET /students/slug/edit' do
  end

  context 'POST /students/slug' do
  end
end