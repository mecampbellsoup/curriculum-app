class GgMailer < ActionMailer::Base
  default from: "gitgallery@gmail.com"

  def registration_confirmation(user)
    @user = user
    # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png") #USE THIS IF YOU WANT TO INCLUDE ATTACHMENT
    mail(:to => @user.email, :subject => "Registration Confirmation")
  end

  def new_project(project, contributor)
    @project = project
    @contributor = contributor

    mail(:to => @contributor["email"], :subject => "A repo you contributed to was just made into a project on Git Gallery.")
  end
end
