
desc 'updates status'
task :update_status => :environment do
  puts "running rake task update_status at #{Time.now}"

  issues = Issue.all

  issues.each do |issue|
    puts "updating the current status of issue #{issue.title}, which has an aasm state of #{issue.aasm_state}"
    issue.current_status
    issue.save
    puts "#{issue.title}'s status is now #{issue.aasm_state}"
  end
end


desc 'write issue'
task :write_issue => :environment do
  puts "running rake task write issue at #{Time.now}"
  user = User.last
  issue = user.issues.create(:title => "cron issue", :description => "cron created me")
  puts "Issue was created and the title is: #{issue.title} and the description is: #{issue.description}."
  puts "Now calling the resolve action on issue #{issue.id}"
  issue.resolve
  issue.save
  puts "the resulting state is #{issue.aasm_state}"
end
