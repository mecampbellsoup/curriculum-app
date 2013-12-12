class UserMailer < ActionMailer::Base
  default from: "services@flatironschool.com"
  
  def registration_confirmation(user)
    mail(:to => user.email, :subject=>"registered!")
  end
  
  def invitation(user)
    @user = user
    mail(:to => user.email, :subject=> "You've been invited to assignment.io!").deliver
  end

  def overdue_notification(user, assignment)
    @assignment = assignment
    mail(:to => user.email, :subject=> "you have an overdue assignment!")
  end

  def assignment_change(user, assignment)
    @assignment = assignment
    mail(:to => user.email, :subject=> "the assignment has changed!")
  end

  def submittal_notification(user, assignment)
    @assignment = assignment
    @user = user
    mail(:to => assignment.author.email, :subject=> "the assignment has been submitted!")
  end

  def reminder(user, assignment)
    @assignment = assignment
    mail(:to => user.email, :subject=> "quick reminder!")
  end

  def create_and_deliver_password_change(user, randompassword)
    @user = user
    @password = randompassword
    mail(:to => user.email, :subject=> "Password Recovery")
    
  end

end


