desc 'adding default passwords for users'
task :adding_passwords => :environment do
  puts "running rake task adding_passwords at #{Time.now}"

  User.all.each do |user|
    unless user.password
      user.password = "test"
      user.save
    end
  end
end

desc 'making sure users have auth_tokens'
task :adding_auth_tokens => :environment do
  puts "running rake task adding_auth_tokens at #{Time.now}"

  User.all.each do |user|
    unless user.auth_token
      user.generate_token(:auth_token)
      user.save
    end
  end
end
