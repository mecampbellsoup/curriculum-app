desc 'Handraise setup'

task :bootstrap  do
  
  # `gem install bundler`
  # `bundle install`
  # `rake db:migrate`

  unless system("which bundle > /dev/null")
    puts "Bundler missing, please install with gem install bunlder"
    exit(1)
  end 

  puts "installing application bundle..."
  system('bundle install')
  puts
  puts "If you haven't already, you should create a database.yml file within the config directory and copy in the contents of database.yml.example, and fill in the fields with your own info. This app is setup to use PostgreSQL. We recommend using http://postgresapp.com/ if you don't already have it installed. You can also use SQLite3, but note that the search functionality will NOT work. If you choose to you'll need replace 'gem \"pg\"' in the gemfile with 'gem \"sqlite3\"' first and setup the database.yml file based on this guide http://guides.rubyonrails.org/getting_started.html#configuring-a-database."
  puts
  puts "Next you should create a setup.yml file in the config directory and copy in the contents of setup.yml.example, and fill in the fields with your own API key info as appropriate. We used Postmark for email delivery, so you 'll have to customize if you want something different."
  puts
  puts "If this script breaks, double check that you've done the two prior tasks correctly and then re-run 'rake bootstrap' from the app's home directory."
  system('rake db:create')
  system('rake db:migrate')

end