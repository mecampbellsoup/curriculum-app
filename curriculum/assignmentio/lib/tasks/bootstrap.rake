require 'fileutils'

desc "set up congieration files"
task :config_files do
  configs = {
    'keys.example.yml.erb' => 'keys.yml',
    'database.example.yml.erb' => 'database.yml'
  }

  configs.each do |example,file_name|
   if File.exists?("config/#{file_name}")
      puts "-- Skipping config/#{file_name}: already exists"
    else
      puts "-- Copying config/#{example} to config/#{file_name}"
      e = ERB.new(File.open("config/#{example}","rb").read)
      File.open("config/#{file_name}", "w") { |io| io.write(e.result)  }
    end
  end
end 

desc "Set up development envierment"
task :bootstrap do
  `bundle`
  require 'SecureRandom'
  Rake::Task['config_files'].execute
  puts "\n"
  Rake::Task['db:migrate'].invoke
  puts "\n"
  Rake::Task['db:seed'].invoke
end
