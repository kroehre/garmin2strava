module Strava
  class TokenRequest

    attr_reader :authorization_code

    def initialize(authorization_code)
      @authorization_code = authorization_code
    end

    def response
      TokenResponse.new(response_body)
    end

    private

    def response_body
      HTTParty.post(uri, query: params).body
    end

    def uri
      Strava.configuration.token_uri
    end

    def params
      {
        client_id:      Strava.configuration.client_id,
        client_secret:  Strava.configuration.client_secret,
        code:           authorization_code
      }
    end

  end
end
