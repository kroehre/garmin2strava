module Garmin
  class ActivitiesClient

    attr_reader :username, :options

    def initialize(username, options={})
      @username = username
      @options  = options
    end

    def activities
      ActivitiesReader.read json
    end

    private

    def json
      HTTParty.get(service_url, service_params).body
    end

    def service_url
      "#{Garmin.configuration.activities_uri}/activities/#{username}"
    end

    def service_params
      { query: options }
    end

  end
end
