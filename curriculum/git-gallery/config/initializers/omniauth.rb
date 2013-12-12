OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, GITHUB_APP_ID, GITHUB_SECRET, scope: "user,repo"
end