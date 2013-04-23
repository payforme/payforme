Mailjet.configure do |config|
  config.api_key = Settings.mailjet.client_id
  config.secret_key = Settings.mailjet.client_secret
  config.domain= 'nicolasgrenie.com'
  config.default_from = "me@nicolasgrenie.com"
end