require 'development_mail_interceptor' #SHOULD THIS MOVE ANYWHERE ELSE?

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "gitgallery",
  :password             => "ggpassword",
  :authentication       => "plain",
  :enable_starttls_auto => true
}


# ActionMailer::Base.default_url_options[:host] = "localhost:3000"  #Moved to config/application.rb
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
