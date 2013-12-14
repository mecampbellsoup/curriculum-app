---
tags: student-project, sinatra, sequel-orm, rspec
language: ruby
---

# Sinatra Students

You're going to build a full CRUD application for the Student Website, powered by Sinatra.

# Setup

## Reading the Codebase

It's a complex project and we've provided you with the skeleton of the project.

```
app/
  concerns/
  controllers/
    application_controller.rb
    students_controller.rb
  models/
    student.rb
  views/
    students/
      index.erb
config/
  environment.rb
coverage/
db/
  migrate/
    01_create_students.rb
lib/
  student_scraper.rb
public/
spec/
  controllers/
    students_controller.rb
  models/
    student_spec.rb
  requests/
  spec_helper.rb
tmp/
config.ru
Gemfile
Guardfile
Rakefile
```

It's important the before you start the project, each of you read the codebase as it currently stands. Every file we've given you has comments in it explaining how it works.

## Bundle

Make sure to run `bundle install ` before doing anything.

## Running the Test Suite

You can run the test suite with:
```bash
rspec
```

Additionally, you should notice that a coverage report is generated via SimpleCov. `open coverage/index.html` to see how your test coverage progress as you complete the assignment.

### Autotest via Guard

The application is setup to use `guard` to auto-run the test suite on most file saves. Start guard with:

```bash
guard
```

## Running Migrations

Migrations are a mechanism for creating our schema through code rather then sequel. To trigger the migration files to run, we use a rake task, defined in the `Rakefile`, `rake db:migrate`. That will apply all unapplied, or unrun, migrations to the database. There are other tasks but don't worry about them.

## Racking Up the Application

Start the application with `rackup`.

# Objectives

## Integrating a Student Scrape

You need to integrate a scrape class into this project to populate your development database.

We suggest using [StudentScraper](https://github.com/flatiron-school/student-scraper-db-003-unit-1/blob/master/lib/models/student_scraper.rb) as a basis for your scrape.

The scrape can be run via running the rake task scrape_students.

```bash
rake scrape_students
```

Try running the scrape immediately (assuming you first followed the instructions above about bundling, migrating, and running the test suite).

You will need to add migrations to create the columns/attributes needed for the scrape class to correctly populate a student's data.

So for instance, the first error you'll see is:

```bash
rake scrape_students
rake aborted!
undefined method `profile_image=' for #<Student @values={:id=>1, :name=>"Alex Chiu"}>
```

While you could solve this with `attr_accessor :profile_image`, that will not persist the data to your database. Instead, add a new migration to the `db/migrate` folder, maybe named `02_add_profile_image_to_students.rb`. That file should contain:

```ruby
Sequel.migration do
  up do 
    add_column :students, :profile_image, Strings
  end

  down do
    remove_column :students, :profile_image
  end
end
```

Then you can migrate your database via `rake db:migrate`.

Now re-run the `rake scrape_students` task and you should get more errors about the Student table/class not having those attributes.

Go into the `lib/student_scraper.rb` and find all the missing attributes. Try to build a migration `03_add_student_attributes.rb` that gets all the attributes you'll need to add. If you miss a few and you've already run the migrations, you can always `rake db:reset` to start fresh.

Feel free to write tests to make sure that the student has those attributes but as they are provided by Sequel, they are already tested. We only test code we write (like the future `Student#slug` method).

When you are done, you should be able to `open db/students-development.db` and see a populated students table.

The scrape should force you to construct a pretty solid Student ORM class.

## The Student Index and the Student Profile

The next step is to get a high fidelity version of the current student site. This include the student index, located at the root of the site, and a student profile (show) page.

You'll have to implement two controller actions in the `StudentsController`. You should write controller specs for these (you'll get a lot of mileage copying the provided ones and modifying as needed).

### Student Index

Iterate over all the students in the Database and display them in the index.erb. For now, don't worry about the frontend that much. What I would do is grab the HTML from the student index and basically comment out all calls to JS/CSS for now, just generate an ugly looking site with the correct HTML that will snap together once you integrate CSS/JS correctly. The student index needs to link, correctly, to each student's profile. The student profiles should be pretty URLs, such as, /students/avi-flombaum


### Student Show

An individual student's profile should be accessible `/students/avi-flombaum` and you should be using the student's slug to query for the student.

Implementing the student slug behavior might be non-trivial. First, you definitely need a slug column in the database. Second, you need to figure out away to create those slugs based on the student's name before you first insert them into the database. The `student_spec.rb` suggests a manner, but worse case, modify the `student_scraper` to just do it brute-force and ignore the `slugify!` specs. 

With the frontend, same rules apply, just grab the HTML from the current site and don't worry about the styles.

### Integrating CSS/JS

You can put the javascript and CSS and images from the live site in public and those will be served as the root of your site. For example:

```
public/stylesheets/style.css
public/javascripts/site.js
public/images/student-profile-pic.jpg
```

You could link to those assets in HTML via:

```html
<link href='/stylesheets/style.css' media='screen' rel='stylesheet' type='text/css'>
<script src="/javascripts/site.js" type="text/javascript"></script>
<img src="/images/student-profile-pic.jpg">
```

Obviously you might have to fix references to assets within those, but everything lives in public is at the root of the site.

## Creating New Students

The next step is to now build a form, accessible at `/students/new` that will allow you to create a new student.

The form should submit via a `POST` to `/students`, take the form data, and save it to the database. That student should appear in the student index. Don't worry how the form looks or how functional it is, if you can't get profile_pic to work, get as much data as you can. This will require building two routes in your `StudentsController`.

See if you can write specs for the form. Within the `students_controller_spec.rb`, I'd imagine seeing something like.

```ruby
context 'POST /students' do
  it 'accepts the form data and creates a student with those attributes' do
    # The `post` Rack::Test method takes a second argument of a POST data hash.    
    post '/students', {:name => "Avi Flombaum"}
    expect(Student.find(:name => "Avi Flombaum")).to be_a(Student)
  end
end
```

## Updating Students

Build an `/students/avi-flombaum/edit` that renders a form with their student data pre-filled in. You should be submitting that form to the update action at `POST /students/avi-flombaum`.

Spec this out too.

# Polish

Go to town, get 100% coverage, add features, maybe FileUploads through a gem that plays nice with Sequel. Make it as realistic as possible.

# Submitting Your Solution

Fork and clone this repository, push up your solution to a `solution` branch.
