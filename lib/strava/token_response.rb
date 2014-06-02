module Strava
  class TokenResponse

    attr_reader :response_json

    def initialize(response_json)
      @response_json = response_json
    end

    def access_token
      response_hash[:access_token]
    end

    def athlete
      Athlete.new(response_hash[:athlete])
    end

    private

    def response_hash
      @response_hash ||= JSON.parse(response_json).with_indifferent_access
    end

  end
end
