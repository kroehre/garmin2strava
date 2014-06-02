ActionDispatch::Callbacks.to_prepare do
  Strava.configure do |config|
    config.authorize_uri = "https://www.strava.com/oauth/authorize"
    config.token_uri     = "https://www.strava.com/oauth/token"
    config.client_id     = ENV["STRAVA_CLIENT_ID"]
    config.client_secret = ENV["STRAVA_CLIENT_SECRET"]
  end
end
