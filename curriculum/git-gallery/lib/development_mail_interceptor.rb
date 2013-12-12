class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "To: #{message.to} -- #{message.subject}"
    message.to = "gitgallery@gmail.com"
  end
end