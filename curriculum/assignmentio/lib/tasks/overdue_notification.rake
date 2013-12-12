namespace :notifications do
  desc 'Send out overdue notifications'
  task :overdue => [:environment] do
    late_userassignments = UserAssignment.list_incomplete_past_due_date
    late_userassignments.each do |lua|
      UserMailer.overdue_notification(lua.user, lua.assignment).deliver
    end
  end
end
namespace :update do
  desc 'Update assignment status'
  task :update_status => [:environment] do
    UserAssignment.check_submissions
  end
end