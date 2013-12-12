# APP_CONFIG = YAML.load_file(Rails.root.join('config/keys.yml'))
# Assignmentio::Application.config.action_mailer.delivery_method   = :postmark
# # Be sure to restart your server when you modify this token.
Assignmentio::Application.config.secret_token = APP_CONFIG["secret_token"]
