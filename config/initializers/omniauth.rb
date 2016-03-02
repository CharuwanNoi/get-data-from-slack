Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, "xoxb-20805671205-QAZNqD9cFLQI2qfBbUaePaEj", "API_SECRET", scope: "client"
end