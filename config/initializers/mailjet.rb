Mailjet.configure do |config|
  config.api_key = Settings.Mailjet.client_id
  config.secret_key = Settings.Mailjet.client_secret
  config.domain= 'nicolasgrenie.com'
  config.default_from = "me@nicolasgrenie.com"
end