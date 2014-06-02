require 'open-uri'

module Garmin
  class ActivityDataClient

    attr_reader :activity_id, :data_type, :options

    def initialize(activity_id, data_type=:gpx, options={ full: true })
      @activity_id = activity_id
      @data_type   = data_type
      @options     = options
    end

    def activity_data
      open(file_url)
    end

    private

    def file_url
      "#{uri}/#{data_type}/activity/#{activity_id}?#{options.to_query}"
    end

    def uri
      Garmin.configuration.activity_data_uri
    end

  end
end
