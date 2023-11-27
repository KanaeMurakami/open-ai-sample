OpenAI.configure do |config|
  config.access_token = Rails.application.credentials.open_ai_secret_key
end
