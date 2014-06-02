module Garmin
  class ActivitiesReader

    def self.read(json)
      new(json).read
    end

    attr_reader :json

    def initialize(json)
      @json = json
    end

    def read
      parse_activities.map do |activity|
        map_activity(activity)
      end
    end

    private

    def parse_activities
      JSON.parse(json)['activityList']
    end

    def map_activity(activity_hash)
      ActivityMapper.map(activity_hash)
    end

  end
end
