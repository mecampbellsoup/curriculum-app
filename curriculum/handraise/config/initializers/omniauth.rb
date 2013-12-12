Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :facebook, APP_CONFIG['fb_api_key'], APP_CONFIG['fb_secret_key'],
                :scope => 'email'
  OmniAuth.config.logger = Rails.logger
end

