module Strava
  class Configuration
    attr_accessor :client_id, :client_secret,
      :authorize_redirect_uri, :authorize_uri,
      :token_uri
  end
end
